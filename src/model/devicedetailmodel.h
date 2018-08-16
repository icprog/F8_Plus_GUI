#ifndef DEVICEDETAILMODEL_H
#define DEVICEDETAILMODEL_H
#include "basemodel.h"
#include <QJsonArray>
#include <QStringListModel>
#include "slot.h"
#include <QQmlListProperty>
class DeviceDetailModel : public BaseModel
{
    Q_OBJECT
    QList<QObject*> m_slotList;
    QStringList m_inputList ;

    Q_PROPERTY(QList<QObject*> slotList READ slotList  NOTIFY slotListChanged)
     Q_PROPERTY(QStringList inputList READ inputList  NOTIFY inputListChanged)
    Q_PROPERTY(int inputTotal READ inputTotal  NOTIFY inputTotalChanged)
    Q_PROPERTY(int inputUsed READ inputUsed  NOTIFY inputUsedChanged)
    Q_PROPERTY(int inputUnUsed READ inputUnUsed  NOTIFY inputUnUsedChanged)
    Q_PROPERTY(int outputTotal READ outputTotal  NOTIFY outputTotalChanged)
    Q_PROPERTY(int outputUsed READ outputUsed  NOTIFY outputUsedChanged)
    Q_PROPERTY(int outputUnUsed READ outputUnUsed  NOTIFY outputUnUsedChanged)

    int m_inputTotal;
    int m_inputUsed;
    int m_inputUnUsed;
    int m_outputTotal;
    int m_outputUsed;
    int m_outputUnUsed;
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
    DeviceDetailModel();
protected:
    void loadModel(const QJsonObject& json);
public:
    DECLARE_GET_INSTANCE(DeviceDetailModel)
    QList<QObject*> slotList();
    QStringList inputList();
    int inputTotal(){return m_inputTotal;}
    int inputUsed(){return m_inputUsed;}
    int inputUnUsed(){return m_inputUnUsed;}
    int outputTotal(){return m_outputTotal;}
    int outputUsed(){return m_outputUsed;}
    int outputUnUsed(){return m_outputUnUsed;}
signals:
    void slotListChanged();
    void inputListChanged();
    void inputTotalChanged();
    void inputUsedChanged();
    void inputUnUsedChanged();
    void outputTotalChanged();
    void outputUsedChanged();
    void outputUnUsedChanged();

};

#endif // DEVICEDETAILMODEL_H
