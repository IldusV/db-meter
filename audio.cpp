#include "audio.h"
#include "QtDebug"

const int BufferSize = 14096;

AudioClass::AudioClass(QObject *parent)
    : QObject(parent),
      m_Inputdevice(QAudioDeviceInfo::defaultInputDevice()),
      m_audioInput(0),
      m_input(0),
      m_buffer(BufferSize),
      m_lvl(0)
{
    qDebug() << "constructing audio object...";

    QList<QAudioDeviceInfo> inputDevices = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);

    QAudioDeviceInfo custom_input_device;
    for(QAudioDeviceInfo d : inputDevices)
    {
        qDebug() << "list" << d.deviceName();
        if(d.deviceName() == "alsa_input.usb-Plantronics_Plantronics_Blackwire_315.1_E44B606D808E8247B93AB73A3A1F9CF5-00.analog-stereo")
        {
            custom_input_device = d;
            qDebug() << "Custom input device has been found!";
        }
    }
    qDebug() << "The custom input audio device is:" << custom_input_device.deviceName();

   // QAudioFormat preferred_format = custom_input_device.preferredFormat();
   // qDebug() << "Preferred codec:" << preferred_format.codec();
    qDebug() << "Preferred codec:" << custom_input_device.preferredFormat().codec();
    qDebug() << "Preferred sample size:" << custom_input_device.preferredFormat().sampleSize();

    m_format.setSampleRate(16000);
    m_format.setChannelCount(1);
    m_format.setSampleSize(custom_input_device.preferredFormat().sampleSize());
    m_format.setSampleType(QAudioFormat::SignedInt);
    m_format.setByteOrder(QAudioFormat::LittleEndian);
    m_format.setCodec(custom_input_device.preferredFormat().codec());

    QAudioDeviceInfo InfoIn(QAudioDeviceInfo::defaultInputDevice());
    //QAudioDeviceInfo InfoIn(custom_input_device);
    if(!InfoIn.isFormatSupported(m_format))
    {
        m_format = InfoIn.nearestFormat(m_format);
        qDebug() << "OOOPS the format is wrong! Using nearest congiguration...";
    }

    m_Inputdevice = custom_input_device;

    m_audioInput = new QAudioInput(m_Inputdevice, m_format, this);
    m_audioInput->setVolume(1);
    m_audioInput->setNotifyInterval(70);

    mInputBuffer.open(QBuffer::ReadWrite);
    m_audioInput->start(&mInputBuffer);
    //m_input = m_audioInput->start();

    //connect(&mInputBuffer, SIGNAL(readyRead()), SLOT(readMore()));
    connect(m_audioInput, SIGNAL(notify()), SLOT(readMore()));
}

double AudioClass::lvl()
{
    return m_lvl;
}

void AudioClass::setLvl(double lvl)
{
    if (lvl != m_lvl)
    {
        m_lvl = lvl;
        emit lvlChanged();
    }
}

void AudioClass::readMore()
{
    mInputBuffer.seek(0);
    QByteArray ba = mInputBuffer.readAll();
   // uint32_t num_samples_sorted;
    int num_samples = ba.length() / 2;
    //qDebug() << "num samples" << num_samples;
    int b_pos = 0;
    for (int i = 0; i < num_samples; i ++) {
        int16_t s;
        s = ba.at(b_pos++);
        s |= ba.at(b_pos++) << 8;
        if (s >= 0)
        {
            if (s != 0)
            {
                mSamples.append((double)s / 32768.0);
                //qDebug() << "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
            } else
            {
                mSamples.append(0);
            }
        }
    }
    //mSamples.append(199);
    //qDebug() << "mSamples size:" << mSamples.size();

    double result = 0;
    for(auto i : mSamples){
      //qDebug() << i;
        //if (i > 0)
            result = result + i;
    }
    result = (double)result/mSamples.size();

    setLvl(result);

    mSamples.clear();

    mInputBuffer.buffer().clear();
    mInputBuffer.seek(0);
}

