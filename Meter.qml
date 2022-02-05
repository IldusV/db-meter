//import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import Audio 1.0

Rectangle {
    id: gaugeglobal
    width: 320
    height: 180

    Image {
        id: scaleDB

        source: "img/radiola_vu_scale.png"
        anchors.centerIn: parent
        anchors.fill: parent
    }

    CircularGauge {
        id: circularGauge
        objectName: "circularGauge_x"

        width: parent.width
        height: parent.width

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        maximumValue: 60
        minimumValue: 0

        value: audioclass.lvl * (maximumValue*1)

        StatusIndicator
        {
            id: statusIndicator

            width: 20
            height: 20
            color: "#a40000"
            active: circularGauge.value >= 40 ? true : false

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.rightMargin: 30

        }

        Behavior on value
        {
            NumberAnimation { duration: 200}
        }

        style: CircularGaugeStyle
        {
            minimumValueAngle: -60
            maximumValueAngle: 60

      //      foreground:
//                Rectangle {
//                    width: gaugeglobal.width
//                    height: gaugeglobal.height
//                    color: "transparent"
//                    anchors.top: parent.top
//                    border.width: 10
//                    border.color: "darkgrey"
//                    visible: true

//            }
            //foreground:
//                Rectangle {
//                width: 26
//                height: 10
//                radius: 7.5
//                anchors.centerIn: parent
//                color: "black"
//                visible:false

//            }



            tickmarkLabel: Rectangle {
                visible: false
            }

            tickmark: Rectangle {
                visible: false
            }

            minorTickmark: Rectangle {
                visible: false
            }

            needle: Rectangle {
                y: 0
                x: 0
                height: outerRadius
                //color: "#0d0b0b"
                 color: Qt.rgba(0.66, 0.3, 0, 1)
                width: 3
                radius: 0
            }
        }
    }
}
