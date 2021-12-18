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
visibility: "FullScreen"
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
                    border.width: 1
                }
                Meter{
                    //                    width: 500
                    //                    height: 340
                    x:-50
                    y:20

                    Text {
                        id: element
                        x: 221
                        y: 170
                        color: "#eeeeec"
                        text: qsTr("TRIM LEFT")
                        font.pixelSize: 14
                    }

                    Rectangle {
                        id: rectangle1
                        x: 80
                        y: 301
                        width: 344
                        height: 140
                        color: "#555753"
                        radius: 10

                        Switch {
                            id: element2
                            x: 26
                            y: 22
                            text: qsTr("Switch")
                        }

                        Switch {
                            id: element3
                            x: 26
                            y: 74
                            text: qsTr("Switch")
                        }

                        StatusIndicator {
                            id: statusIndicator
                            x: 0
                            y: -111
                        }
                    }
                    //                anchors.rightMargin: 800;
                    //                anchors.bottomMargin: 200
                }
                Meter{
                    //                    width: 500
                    //                    height: 340
                    x:350
                    y:20

                    Text {
                        id: element1
                        x: 218
                        y: 170
                        color: "#eeeeec"
                        text: qsTr("TRIM RIGHT")
                        font.pixelSize: 14
                    }

                    Rectangle {
                        id: rectangle2
                        x: 86
                        y: 301
                        width: 340
                        height: 142
                        color: "#555753"
                        radius: 10

                        Switch {
                            id: element4
                            x: 32
                            y: 19
                            text: qsTr("Switch")
                        }

                        Switch {
                            id: element5
                            x: 32
                            y: 72
                            text: qsTr("Switch")
                        }
                    }

                    StatusIndicator {
                        id: statusIndicator1
                        x: 86
                        y: 191
                    }
                }

                Dial {
                    id: dial
                    x: 134
                    y: 208
                    width: 133
                    height: 102
                    maximumValue: 5
                    stepSize: 1
                }
                Dial {
                    id: dial1
                    x: 534
                    y: 208
                    width: 133
                    height: 102
                    stepSize: 1
                    tickmarksVisible: true
                    maximumValue: 5
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
