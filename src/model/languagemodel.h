#ifndef LANGUAGEMODEL_H
#define LANGUAGEMODEL_H
#include "basemodel.h"

class LanguageModel : public BaseModel
{
    Q_OBJECT
    /** 使用Q_PROPERTY宏定义qml域属性 **/

    LanguageModel();
public:
    DECLARE_GET_INSTANCE_FOR_MODEL(LanguageModel)

    QString lang();
    void setLang(const QString& lang);
signals:
    void langChanged();
};

#endif // LANGUAGEMODEL_H
