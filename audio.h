#ifndef AUDIO_H
#define AUDIO_H

#include <QObject>
#include <QVector>
#include <qaudioinput.h>
#include <QBuffer>
#include <QAudioDeviceInfo>

class AudioClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double getLvl READ getLvl WRITE setLvl NOTIFY lvlChanged)

public:
    explicit AudioClass(QObject *parent = nullptr);
    double getLvl();
    Q_INVOKABLE QStringList getSourceList();

signals:
    void lvlChanged();

public slots:
    void setLvl(double getLvl);
    void setInputCurrentSourceIdx(int);

private slots:
    void readMore();

private:
    QBuffer m_input_buffer;
    double m_lvl;
    QStringList m_input_source_name_list;
    uint8_t m_current_input_source_idx;
    QList<QAudioDeviceInfo> m_input_source_device_list;
    void initializeInputSource(int);
};

#endif // AUDIO_H
