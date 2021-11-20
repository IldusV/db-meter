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
//    Q_INVOKABLE void triggerEvent(uint8_t db_value) {
//     emit somethingHappened(db_value);
//    }
    double lvl();

private:


signals:
    //void somethingHappened(uint8_t db_value);
    void lvlChanged();

public slots:
    void setLvl(double lvl);

private slots:
    void readMore();

private:
    QAudioDeviceInfo m_Inputdevice;
    QAudioFormat m_format;
    QAudioInput *m_audioInput;
    QIODevice *m_input;
    QVector<char> m_buffer;
    QBuffer mInputBuffer;
    QVector<double> mSamples;
    QVector<double> mIndices;
    double m_lvl;
};

#endif // AUDIO_H
