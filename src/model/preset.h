#ifndef PRESET_H
#define PRESET_H

#include <QObject>
#include <QJsonObject>
class Preset : public QObject
{
    Q_OBJECT
    QString m_name;
    int m_presetId;
    Q_PROPERTY( QString name READ name NOTIFY nameChanged)
    Q_PROPERTY(int presetId READ presetId  NOTIFY presetIdChanged)
public:
    explicit Preset(const QJsonObject& json,QObject *parent = 0);

    QString name(){return m_name;}
    int presetId(){
        return m_presetId;
    }
signals:
    void nameChanged();
     void presetIdChanged();
};

#endif // PRESET_H
