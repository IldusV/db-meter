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
    Q_PROPERTY(double lvl READ lvl WRITE setLvl NOTIFY lvlChanged)

public:
    explicit AudioClass(QObject *parent = nullptr);
    double lvl();
    Q_INVOKABLE QStringList getSourceList();

signals:
    void lvlChanged();

public slots:
    void setLvl(double lvl);
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
