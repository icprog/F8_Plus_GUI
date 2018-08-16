#ifndef PRESETSMODEL_H
#define PRESETSMODEL_H
#include "basemodel.h"
#include <QList>
#include "preset.h"
class PresetsModel : public BaseModel
{
    Q_OBJECT
    QList<QObject*> m_presetsList1;//左列
    QList<QObject*> m_presetsList2;//右列
    Q_PROPERTY( QList<QObject*> presets1 READ presets1    NOTIFY presets1Changed)
    Q_PROPERTY( QList<QObject*> presets2 READ presets2    NOTIFY presets2Changed)
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
    PresetsModel();
public:
    ~PresetsModel();
    DECLARE_GET_INSTANCE(PresetsModel)
    QList<QObject*> presets1(){
        return m_presetsList1;
    }
    QList<QObject*> presets2(){
        return m_presetsList2;
    }
    void loadModel(const QJsonObject &);
signals:
    void presets1Changed();
    void presets2Changed();
};

#endif // PRESETSMODEL_H
