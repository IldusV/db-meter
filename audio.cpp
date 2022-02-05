#include "audio.h"
#include "QtDebug"

const int BufferSize = 14096;

AudioClass::AudioClass(QObject *parent)
    : QObject(parent),
      m_buffer(BufferSize),
      m_lvl(0),
      m_input_source_name_list(0),
      m_current_input_source_idx(0),
      m_audio_input(NULL)
{
    qDebug() << "constructing audio object...";

    m_input_source_device_list = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);

    for(QAudioDeviceInfo element : m_input_source_device_list)
        m_input_source_name_list.append(element.deviceName());

    initializeInputSource(0);
}

QStringList AudioClass::getSourceList()
{
    return m_input_source_name_list;
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

void AudioClass::initializeInputSource(int n)
{
    QAudioFormat audio_format;

    if(n)
        n--;
    qDebug() << n;
    qDebug() << "The custom input audio device is:" << m_input_source_device_list[n].deviceName();

    audio_format.setSampleRate(8000);
    audio_format.setChannelCount(1);
    audio_format.setSampleSize(m_input_source_device_list[n].preferredFormat().sampleSize());
    audio_format.setSampleType(QAudioFormat::SignedInt);
    audio_format.setByteOrder(QAudioFormat::LittleEndian);
    audio_format.setCodec(m_input_source_device_list[n].preferredFormat().codec());

    QAudioDeviceInfo InfoIn(QAudioDeviceInfo::defaultInputDevice());
    if(!InfoIn.isFormatSupported(audio_format))
    {
        audio_format = InfoIn.nearestFormat(audio_format);
        qDebug() << "OOOPS the format is wrong! Using nearest congiguration...";
    }


    if (m_audio_input != NULL)
    {
        disconnect(m_audio_input, SIGNAL(notify()),0,0);
        delete m_audio_input;
    }

    //m_audio_input->stop();
    m_audio_input = new QAudioInput(m_input_source_device_list[n], audio_format, this);
    m_audio_input->setVolume(1);
    m_audio_input->setNotifyInterval(70);

    mInputBuffer.open(QBuffer::ReadWrite);
    m_audio_input->start(&mInputBuffer);


    connect(m_audio_input, SIGNAL(notify()), SLOT(readMore()));
}

void AudioClass::setInputCurrentSourceIdx(int n)
{
    if(n != m_current_input_source_idx)
    {
        m_current_input_source_idx = n;
        initializeInputSource(n);
        //emit m_current_input_source_idxChanged;

    }
    qDebug() << "setInputSource called:" << n;
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
    qDebug() << result;
    setLvl(result);

    mSamples.clear();

    mInputBuffer.buffer().clear();
    mInputBuffer.seek(0);
}



