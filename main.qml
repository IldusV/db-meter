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
                    width: 496
                    height: 339
                }

                Text {
                    id: element
                    x: 167
                    y: 196
                    color: "#eeeeec"
                    text: qsTr("TRIM LEFT")
                    font.pixelSize: 16
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
                    font.pixelSize: 16
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

            RowLayout {
                x: 28
                y: 323
                width: 735
                height: 140

                Rectangle {
                    id: rectangleFilters
                    x: 28
                    y: 323
                    width: 239
                    height: 140
                    color: "#3b5066"
                    radius: 10
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    border.width: 0
                    anchors.bottomMargin: 200

                    Text {
                        text: "FILTERS"
                        color: "white"
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Dial {
                        id: dialLPF
                        x: 31
                        y: 50
                        width: 70
                        height: 70
                        //Layout.minimumWidth: 30
                        //Layout.preferredWidth: 70

                        Text {
                            id: textLPF
                            y: -21
                            text: qsTr("LPF")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            id: text19
                            y: 71
                            text: qsTr("19")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Dial {
                        id: dialHPF
                        x: 143
                        y: 50
                        width: 70
                        height: 70

                        Text {
                            id: textHPF
                            y: -19

                            text: qsTr("HPF")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            id: text20000
                            y: 71
                            text: qsTr("20000")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

                Rectangle {
                    id: rectangleDynEq
                    x: 273
                    y: 323
                    width: 239
                    height: 140
                    color: "#3b5066"
                    radius: 10
                    border.width: 0
                    anchors.bottomMargin: 200

                    Text {
                        id: textrectangleDynEq
                        text: qsTr("DYN EQ")
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 18
                        color: "white"
                    }

                    Dial {
                        x: 31
                        y: 50
                        height: 70
                        width: 70

                        Text {
                            id: textFreqq
                            y: -18

                            text: qsTr("FREQ")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            id: text2736
                            y: 71
                            text: qsTr("2736")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                    }

                    Dial {
                        x: 143
                        y: 50
                        height: 70
                        width: 70

                        Text {
                            id: textDepth
                            y: -18

                            text: qsTr("DEPTH")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            id: text100
                            y: 71
                            text: qsTr("100")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                    }


                }

                Rectangle {
                    id: rectangleMonoMaker
                    x: 527
                    y: 323
                    width: 239
                    height: 140
                    color: "#3b5066"
                    radius: 10
                    border.width: 0
                    anchors.bottomMargin: 200

                    Text {
                        id: textMonoMaker
                        text: qsTr("MONO MAKER")
                        color: "white"
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Dial {
                        x: 31
                        y: 50
                        height: 70
                        width: 70

                        Text {
                            id: textFreq
                            y: -18

                            text: qsTr("FREQ")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            id: text80
                            y: 71
                            text: qsTr("80")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Dial {
                        x: 143
                        y: 50
                        height: 70
                        width: 70

                        Text {
                            id: textAmount
                            y: -18

                            text: qsTr("AMOUNT")
                            anchors.horizontalCenterOffset: 0
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            id: text1001
                            y: 71
                            text: qsTr("100")
                            anchors.horizontalCenterOffset: 0
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                    }

                }
            }
        }

        //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

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
