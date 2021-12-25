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
        anchors.centerIn: parent

        width: 800
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        Page {
            height: 400

            //anchors.centerIn: parent

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

      //      Item {
        //        id: meterGroup1
          //      anchors.horizontalCenter: parent.width/4

                //x: 0

                Meter {

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -190
                    anchors.top: parent.top
                    anchors.topMargin: 20

                    //anchors.horizontalCenter: 0
                    //anchors.centerIn: parent.width/2
//                    width: 496
//                    height: 339
                }
Item {
                Text {
                    id: element
                    x: 171
                    y: 203
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
                    x: 147
                    y: 232
                    width: 125
                    height: 73
                    stepSize: 1
                    tickmarksVisible: true
                    maximumValue: 5

                }
            }

            //***********************************************************
            Meter {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 190
                anchors.top: parent.top
                anchors.topMargin: 20
            }

            Item {
                id: meterGroup2



                Text {
                    id: elementTextTrimLeft
                    x: 551
                    y: 201
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
                    x: 535
                    y: 226
                    width: 119
                    height: 75
                    stepSize: 1
                    tickmarksVisible: true
                    maximumValue: 5
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
                    width: 240
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
                        font.pixelSize: 17
                        font.bold: true
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            top: parent.top
                            topMargin: 5
                        }
                    }

                    Dial {
                        id: dialHPF

                        width: 65
                        height: 65
                        anchors {
                            verticalCenter: parent.verticalCenter
                            verticalCenterOffset: 15
                            horizontalCenter: parent.horizontalCenter
                            horizontalCenterOffset: -parent.width/4
                        }

                        Rectangle {
                            id: rectangleDB

                            height: 20
                            width: 45
                            radius: 10
                            color: "slategrey"
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: 22
                                verticalCenter: textHPF.verticalCenter
                            }

                            Text {
                                id: text6db
                                text: qsTr("6 dB")
                                font.pixelSize: 14
                                font.bold: true
                                color: "white"
                                anchors.centerIn: parent

                            }
                        }

                        Text {
                            id: textHPF

                            text: qsTr("HPF")
                            color: "white"
                            font.bold: true
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: -22
                                bottom: parent.top
                            }
                        }

                        Text {
                            id: text19

                            text: qsTr("19")
                            color: "white"
                            font.bold: true
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                top: parent.bottom
                            }
                        }
                    }

                    Dial {
                        id: dialLPF

                        width: 65
                        height: 65
                        tickmarksVisible: true


                        anchors {
                            verticalCenter: parent.verticalCenter
                            verticalCenterOffset: 15
                            horizontalCenter: parent.horizontalCenter
                            horizontalCenterOffset: parent.width/4
                        }

                        Rectangle {
                            id: rectangleDB1

                            height: 20
                            width: 45
                            radius: 10
                            color: "slategrey"
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: 22
                                verticalCenter: textLPF.verticalCenter
                            }

                            Text {
                                id: text18db
                                text: qsTr("18 dB")
                                font.pixelSize: 14
                                font.bold: true
                                color: "white"
                                anchors.centerIn: parent

                            }
                        }

                        Text {
                            id: textLPF

                            text: qsTr("LPF")
                            color: "white"
                            font.bold: true
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                horizontalCenterOffset: -22
                                bottom: parent.top
                                bottomMargin: 2
                            }
                        }

                        Text {
                            id: text20000

                            text: qsTr("20000")
                            color: "white"
                            font.bold: true
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                                top: parent.bottom
                            }
                        }
                    }

                    Rectangle {
                        id: rectanglePowerButton
                        width: 24
                        height: 24
                        radius: 12
                        color: "#a9a9a9"


                        anchors {
                            top: parent.top
                            topMargin: 4
                            right: parent.right
                            rightMargin: 4
                        }

                        Image {
                            id: imagePowerButton
                            visible: true
                            height:18
                            width: 18

                            source: "img/power.png"
                            //source: "img/power-on.png"

                            //anchors.fill: parent
                            anchors.centerIn: parent
                            anchors.verticalCenterOffset:-1
                        }

                        MouseArea {
                            anchors.fill: parent
                            anchors.centerIn: parent
                            onClicked: {
                                parent.color = (parent.color == "#a9a9a9") ? "#32cd32" : "#a9a9a9"
                            }
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
