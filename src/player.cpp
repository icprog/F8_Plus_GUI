#include "player.h"

#include <QDebug>
#include <QMutex>

static void _padAddedHandler (GstElement *l_elem, GstPad *new_pad, GstElement *elem)
{
    GstPad *sink_pad = NULL;
     GstPadLinkReturn ret;

    QString pad_name,elem_name;


    pad_name = gst_pad_get_name (new_pad);
    elem_name = gst_element_get_name(l_elem);
    qDebug ("A new pad %s was created for %s\n", pad_name.toUtf8().data(),elem_name.toUtf8().data());
    if( !pad_name.startsWith("video") && ! pad_name.startsWith("recv_rtp_src")   )
    {
        qDebug ("new_pad don't match the elem.");
        goto exit;
    }
    sink_pad = gst_element_get_static_pad (elem, "sink");

     /* If our elem is already linked, we have nothing to do here */
     if (gst_pad_is_linked (sink_pad)) {
       qDebug ("already linked. Ignoring.\n");
       goto exit;
     }

     /* Attempt the link */
      ret = gst_pad_link (new_pad, sink_pad);
      if (GST_PAD_LINK_FAILED (ret)) {
        qDebug ("  Link failed.\n");
      } else {
        qDebug ("  Link succeeded.\n");
      }
    exit:
      /* Unreference the sink pad */
      if(sink_pad != NULL)
          gst_object_unref(sink_pad);

}
gboolean bus_callback(GstBus *,GstMessage *msg,gpointer data)
{
    Player *player=(Player*)data;

    //qDebug("%s recive message:%s\n",gst_object_get_name (GST_MESSAGE_SRC(msg)),GST_MESSAGE_TYPE_NAME(msg));
    switch(GST_MESSAGE_TYPE(msg))
    {
        case GST_MESSAGE_ERROR:
        {

        }
        break;
        case GST_MESSAGE_STATE_CHANGED:
        {
            GstState oldState,newState;
            gst_message_parse_state_changed(msg, &oldState, &newState, NULL);
            if ( GST_MESSAGE_SRC(msg)  == GST_OBJECT(player->pipeline()) ) {
              //qDebug ("Pipeline state changed from %d to %d:\n",
              //    newState, newState);
              player->emitStateChanged();
            }
            break;
        }
        default:;
    }
    return true;
}


    /*******
     *
      GST_STATE_VOID_PENDING        = 0,
      GST_STATE_NULL                = 1,
      GST_STATE_READY               = 2,
      GST_STATE_PAUSED              = 3,
      GST_STATE_PLAYING             = 4
     * *******/
  int  Player::state()
  {
    GstState  state, pending;
    gst_element_get_state(GST_ELEMENT(m_pipeline),&state,&pending,300);
    return state;
  }

#define FAILURE_WARNING(WARN_STR,GOTO_LABEL )   do { \
    qCritical(WARN_STR);    \
    return nullptr;    \
    }while (0)
  /*****************
   * gst-launch-1.0 rtspsrc location="rtsp://localhost:8554/test" ! rtpjitterbuffer ! rtpmp2tdepay ! tsdemux ! h264parse ! avdec_h264 ! videoconvert  ! autovideosink
   * **************/
   Player* Player::Create(QWidget* _parent)
  {
      GstElement* pipeline = gst_pipeline_new(NULL);
      if(!pipeline)
          FAILURE_WARNING("create the player pipeline failure",_end);
     GstElement* src = gst_element_factory_make("rtspsrc","rtspsrc");
      if(!src)
          FAILURE_WARNING("create the player src failure",_end);
      g_object_set(G_OBJECT(src),"location","rtsp://192.168.10.146:8554/test",NULL);
     GstElement*  rtpmp2tdepay = gst_element_factory_make("rtpmp2tdepay","rtpmp2tdepay");
     if(!rtpmp2tdepay)
         FAILURE_WARNING("create the rtpmp2tdepay failure",_end);
    GstElement*  tsdemux = gst_element_factory_make("tsdemux","tsdemux");
    if(!tsdemux)
        FAILURE_WARNING("create the tsdemux failure",_end);
    GstElement*  h264parse = gst_element_factory_make("h264parse","h264parse");
    if(!h264parse)
        FAILURE_WARNING("create the h264parse failure",_end);

    GstElement*  videoconvert = gst_element_factory_make("videoconvert","videoconvert");
    if(!videoconvert)
        FAILURE_WARNING("create the videoconvert failure",_end);
#ifdef ARM
    GstElement*  sink =gst_element_factory_make("rkximagesink","rkximagesink");
#else
    GstElement* sink = gst_element_factory_make("xvimagesink","ximagesink");
#endif
    if(!sink)
        FAILURE_WARNING("get the sink failure",_end);
    gst_bin_add_many (GST_BIN(pipeline), src, rtpmp2tdepay, tsdemux, h264parse,videoconvert, sink, NULL);
    g_signal_connect (src, "pad-added", G_CALLBACK (_padAddedHandler),rtpmp2tdepay);
    gst_element_link_many ( rtpmp2tdepay,tsdemux,NULL);
    g_signal_connect (tsdemux, "pad-added", G_CALLBACK (_padAddedHandler),h264parse);
    gst_element_link ( videoconvert,sink);



     Player* player = new Player;
     player->m_pipeline = pipeline;
     player->m_win = new QWidget(_parent);
     player->m_dummy_win = new QWidget;
     player->m_dummy_win->resize(0,0);
     player->m_dummy_win->hide();
     player->m_win->setStyleSheet(QLatin1String("\n"
"background-color: rgba(255, 255, 255, 0);"));
      player->m_win->hide();
       player->m_sink = sink;

       player->m_dec_l = h264parse;
       player->m_dec_r = videoconvert;


     GstBus *bus = gst_element_get_bus (pipeline);
     gst_bus_add_watch(bus,bus_callback,player);
     gst_object_unref (bus);
    return player;

  }


  void Player::play()
  {
      if (m_pipeline) {
#ifdef ARM
      m_dec_h264 =  gst_element_factory_make("mppvideodec","dec_h264")  ;
      qDebug("make  mppvideodec");
#else
       m_dec_h264 = gst_element_factory_make("avdec_h264","dec_h264");
      qDebug("make  avdec_h264");
#endif
      if(!m_dec_h264)
      {
          qWarning("create the dec_h264 failure");\
          return;
      }

        gst_bin_add(GST_BIN(m_pipeline),m_dec_h264);
        gst_element_link_many(m_dec_l,m_dec_h264,m_dec_r,NULL);
          gst_element_set_state (m_pipeline,GST_STATE_PLAYING);
      }
  }
  void Player::stop()
  {
      if (m_pipeline) {
          gst_element_set_state (m_pipeline,GST_STATE_NULL);
          gst_element_set_state(m_dec_h264,GST_STATE_NULL);
          gst_bin_remove(GST_BIN(m_pipeline),m_dec_h264);
          int refCount = GST_OBJECT_REFCOUNT_VALUE(m_dec_h264);
          qDebug("recCount=%d",refCount);
          for(int i = 0;i < refCount; i++)
              gst_object_unref(m_dec_h264);


      }
  }
