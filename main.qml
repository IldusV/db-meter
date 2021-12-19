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
//    visibility: "FullScreen"

    // This will prevent the window from expansion
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    SwipeView {
        id: swipeView
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page {
            width: 800
            height: 400

            AudioClass {
                id: audioclass
            }

            Rectangle {
                id: rectangle
                color: "slategray"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.fill: parent
                border.width: 10
                border.color: "darkgrey"
            }

            Item {
                id: meterGroup1

                Meter {
                    x: -50
                    y: 20
                }

                Text {
                    id: element
                    x: 167
                    y: 196
                    color: "#eeeeec"
                    text: qsTr("TRIM LEFT")
                    font.pixelSize: 14
                }

                Rectangle {
                    id: rectangle1
                    x: 28
                    y: 318
                    width: 344
                    height: 140
                    color: "#555753"
                    radius: 10

                    Switch {
                        id: element3
                        x: 8
                        y: 43
                        text: qsTr("Switch")
                    }
                    anchors.bottomMargin: 200
                }

                Switch {
                    id: element2
                    x: 22
                    y: 248
                    font.pixelSize: 14

                    Text {
                        id: element2Text
                        x: 10
                        y: 42
                        text: qsTr("ON/OFF")
                        color: "white"
                    }
                }

                StatusIndicator {
                    id: statusIndicator
                    x: 28
                    y: 208
                    active: element2.checked ? true : false
                    color: "green"

                    Text {
                        id: textL
                        x: 45
                        y: 4
                        text: qsTr("L")
                        color: "white"
                        font.pixelSize: 22
                    }
                }

                Dial {
                    id: dial1
                    x: 134
                    y: 208
                    width: 133
                    height: 102
                    stepSize: 1
                    tickmarksVisible: true
                    maximumValue: 5

                }

                Rectangle {
                    id: rectangle3
                    x: 23
                    y: 14
                    width: 355
                    height: 180
                    color: "#00000000"
                    radius: 20
                    border.color: "darkgrey"
                    border.width: 10
                }
            }

            //***********************************************************

            Item {
                id: meterGroup2

                Meter {
                    x: 332
                    y: 21
                }

                Text {
                    id: elementTextTrimLeft
                    x: 544
                    y: 196
                    color: "#eeeeec"
                    text: qsTr("TRIM RIGHT")
                    font.pixelSize: 14
                }

                Rectangle {
                    id: rectangle2
                    x: 413
                    y: 321
                    width: 344
                    height: 140
                    color: "#555753"
                    radius: 10

                    Switch {
                        id: element5
                        x: 8
                        y: 43
                        text: qsTr("Switch")
                    }
                    anchors.bottomMargin: 200
                }

                Switch {
                    id: switchOnOffRight
                    x: 413
                    y: 257
                    font.pixelSize: 14

                    Text {
                        id: elementTextOnOff
                        x: 10
                        y: 42
                        text: qsTr("ON/OFF")
                        color: "white"
                    }
                }

                StatusIndicator {
                    id: statusIndicatorRight
                    x: 413
                    y: 208
                    active: switchOnOffRight.checked ? true : false
                    color: "green"

                    Text {
                        id: textR
                        x: 45
                        y: 4
                        text: qsTr("R")
                        color: "white"
                        font.pixelSize: 22
                    }
                }

                Dial {
                    id: dial2
                    x: 516
                    y: 208
                    width: 133
                    height: 102
                    stepSize: 1
                    tickmarksVisible: true
                    maximumValue: 5
                }
                Rectangle {
                    id: rectangle4
                    x: 405
                    y: 15
                    width: 355
                    height: 180
                    color: "#00000000"
                    radius: 20
                    border.color: "darkgrey"
                    border.width: 10

                }

            }

        }



        Page {
            width: 600
            height: 400


            header: Label {
                text: qsTr("Page 1")
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
            }

            Label {
                text: qsTr("You are on Page 1.")
                anchors.centerIn: parent
            }
        }

    }
}
