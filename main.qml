import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
//import QtQuick.Templates 2.5
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import Audio 1.0

ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: qsTr("VU Meter")

    // This will prevent the window from expansion
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {

        }

        Page2Form {
            AudioClass {
                id: audioclass
            }

//            menuBar: MenuBar {
//                visible: true
//            }

            header: ToolBar {
                visible: false
            }

            CircularGauge {
                id: circularGauge
                objectName: "circularGauge_x"
                x: 0
                y: 0
                width: 0
                height: 0
                visible: true
                clip: false
                anchors.rightMargin: 0
                anchors.bottomMargin: -129
                anchors.leftMargin: 0
                anchors.topMargin: 0

                maximumValue: 60
                minimumValue: 0

        //        property bool accelerating

                //onSomethingHappened: needle_value = db_value

                value: audioclass.lvl * (maximumValue*5)
        //        value: accelerating ? maximumValue : 0
        //       //maximumValue: 250
                anchors {
                    fill: parent
                    margins: window.height * 0.2
                }

                StatusIndicator
                {
                    id: statusIndicator
                    x: 219
                    y: 50
                    width: 19
                    height: 16
                    color: "#cc0000"
                    active: circularGauge.value >= 40 ? true : false
                    opacity: 1
                    visible: true
                }

                Behavior on value
                {
                    NumberAnimation { duration: 200}
                }

                style: CircularGaugeStyle
                {
                    minimumValueAngle: -45
                    maximumValueAngle: 45

                    foreground:
                        Item {
                        }

                    background:
                        Image {
                        id: scale_custom
                        source: "img/TEAK_UV_meterX.svg"
                        fillMode: Image.PreserveAspectFit
                        verticalAlignment: Image.AlignTop
                        visible: true
                    }

                    tickmarkLabel:
                        Text {
                        font.pixelSize: Math.max(6, outerRadius * 0.1)
                        font.bold: false
                        font.italic: false
                        text: styleData.index
                        color: "black" //styleData.value >= 80 ? "#e34c22" : "#e5e5e5"
                        antialiasing: false
                        visible: false
                    }

                    tickmark: Rectangle {
                        id: tickm1
                        visible: false
                        implicitWidth: outerRadius * 0.015
                        antialiasing: true
                        implicitHeight: outerRadius * 0.1
                        color: styleData.value >= 40 ? "#e34c22" : "#black"
                    }

                    minorTickmark: Rectangle {
                        //visible: true
                        x: 0
                        y: 6
                        visible: false//styleData.value < 40
                        implicitWidth: outerRadius * 0.01
                        antialiasing: true
                        implicitHeight: outerRadius * 0.05
                        color: "black"
                    }

                    needle: Rectangle {
                        y: -8
                        x: 0
                        height: outerRadius * 0.8
                        width: 2
                        color: "dimgray"
                        radius: 0
                    }
                }
            }
        }
    }
}
