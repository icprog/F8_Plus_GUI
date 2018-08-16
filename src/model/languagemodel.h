#ifndef LANGUAGEMODEL_H
#define LANGUAGEMODEL_H
#include "basemodel.h"

class LanguageModel : public BaseModel
{
    Q_OBJECT
    /** 使用Q_PROPERTY宏定义qml域属性 **/
    Q_PROPERTY(const QString lang READ lang WRITE setLang NOTIFY langChanged)//语言

    LanguageModel();
#ifndef DEBUG_WITHOUT_MIDDLEWARE
    QJsonObject readLowLevel();                 //具体的业务底层读接口
    int writeLowLevel(const QJsonObject& json); //具体的业务底层写接口
#endif//DEBUG_WITHOUT_MIDDLEWARE
public:
    DECLARE_GET_INSTANCE(LanguageModel)

    QString lang();
    void setLang(const QString& lang);
signals:
    void langChanged();
};

#endif // LANGUAGEMODEL_H
