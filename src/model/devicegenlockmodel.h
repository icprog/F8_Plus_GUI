#ifndef DEVICEGENLOCKMODEL_H
#define DEVICEGENLOCKMODEL_H
#include "basemodel.h"

class DeviceGenlockModel : public BaseModel
{
    Q_OBJECT
    Q_PROPERTY( int enable READ enable WRITE setEnable NOTIFY enableChanged)//设备名称
    Q_PROPERTY( int type READ type WRITE setType NOTIFY typeChanged)//设备名称
    Q_PROPERTY( int inputId READ inputId WRITE setInputId NOTIFY inputIdChanged)//设备名称
    DeviceGenlockModel();
public:
    DECLARE_GET_INSTANCE(DeviceGenlockModel)
    int enable(){
        return getValue("enable").toInt();
    }
    void setEnable(int enable){
        setValue("enable",enable);
    }

    int type(){return getValue("type").toInt();}
    void setType(int type){
        setValue("type",type);
    }
    int inputId(){return getValue("inputId").toInt();}
    void setInputId(int inputId){
        setValue("inputId",inputId);
    }
signals:
    void enableChanged();
    void typeChanged();
    void inputIdChanged();
};
#endif // DEVICEGENLOCKMODEL_H
