#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QThread>
#include <QMap>
#include <QHash>
#include <QWidget>
#include <gst/gst.h>
#include <gst/video/videooverlay.h>

class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int state READ state NOTIFY stateChanged)
    QWidget* m_win;
    QWidget* m_dummy_win;

    GstElement* m_pipeline;
    GstElement* m_sink;
    GstElement* m_dec_h264 = NULL;
    GstElement* m_dec_l;
    GstElement* m_dec_r;

    Player(){}
public:

    static Player* Create(QWidget* parent);

    Q_INVOKABLE void show(){
        gst_video_overlay_set_window_handle (GST_VIDEO_OVERLAY (m_sink), m_win->winId());
        m_win->show();
    }
    Q_INVOKABLE void hide(){
        qDebug("hide widget");
        m_win->hide();
    }
    Q_INVOKABLE void setGeometry(int x, int y, int w, int h){
        m_win->setGeometry(x,y,w,h);

    }

    Q_INVOKABLE void play();
     Q_INVOKABLE void stop();
    GstElement* pipeline(){return m_pipeline;}
    int state();
    void emitStateChanged(){emit stateChanged();}
signals:
    void stateChanged();
    void videoSurfaceChanged();
private:

};

#endif // PLAYER_H
