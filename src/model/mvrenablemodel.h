#ifndef MVRENABLEMODEL_H
#define MVRENABLEMODEL_H
#include "basemodel.h"

class MVREnableModel : public BaseModel
{
    Q_OBJECT
    Q_PROPERTY(int enable READ enable WRITE  setEnable NOTIFY enableChanged)//语言
    MVREnableModel();
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
public:
    DECLARE_GET_INSTANCE(MVREnableModel)
    int enable(){return getValue("enable").toInt();}
    void setEnable(int enable){setValue("enable",enable);}
signals:
    void enableChanged();
};

#endif // MVRENABLEMODEL_H
