import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import Audio 1.0

ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: qsTr("VU Meter")
    //    visibility: "FullScreen"

    // This will prevent the window from resizing
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    AudioClass {
       id: audioclass
    }

    Rectangle {
        color: "slategray"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        border.width: 10
        border.color: "darkgrey"

        ComboBox {
            id: comboBox
            x: 254
            y: 239
            width: 273
            currentIndex: 0
            height: 25
            model: audioclass.getSourceList()
            onActivated: audioclass.setInputCurrentSourceIdx(comboBox.currentIndex)
            anchors {
                centerIn: parent
                verticalCenterOffset: 25
            }

            Text {
                text: "Input Device"
                color: "white"
                font.pixelSize: 12
                font.bold: true
                anchors.left: parent.left
                anchors.bottom: parent.top
                anchors.bottomMargin: 5
           }
        }
    }

    Rectangle {
        width: 730
        height: 196
        color: "#3b5066"
        anchors.horizontalCenterOffset: 0

        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
    }

    Rectangle {
        width: 35
        height: 35
        radius: 2

        color: "#3b5066"
        border.color: "black"
        border.width: 1

        anchors {
            top: meterL.bottom
            topMargin: 80
            horizontalCenter: meterL.horizontalCenter
            horizontalCenterOffset: -88

        }

        RadialGradient {
            id: radialGradient1

            anchors.centerIn: parent
            //keep parent borders visible this way
            width: parent.width-2
            height: parent.height-2

            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightgreen" }
                GradientStop { position: 0.5; color: "green" }
            }
            visible: false
        }

        Text {
            id: textMS
            text: qsTr("MS")
            anchors.centerIn: parent
            font.pixelSize: 16
            font.bold: true
            color: "white"
        }

        MouseArea {
            property var ms_active: false
            anchors.fill: parent
            onClicked: {
                if (ms_active) {
                    radialGradient1.visible = false
                    textMS.color = "white"
                    textMS.font.bold = true
                }
                else {
                    radialGradient1.visible = true
                    textMS.color = "black"
                    textMS.font.bold = false
                }
                ms_active = !ms_active
                console.log("button MS pressed")
            }
        }
    }

    Rectangle {
        width: 35
        height: 35
        radius: 2
        color: "#3b5066"
        border.color: "black"
        border.width: 1

        anchors {
            top: meterL.bottom
            topMargin: 80
            horizontalCenter: meterL.horizontalCenter
            horizontalCenterOffset: -140
        }

        Text {
            y: -24
            width: 83.55
            text: "DISPLAY"
            font.bold: true
            anchors.horizontalCenterOffset: 38
            font.pixelSize: 16
            color: "white"
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.top
                bottomMargin: 5
            }
        }

        RadialGradient {
            id: radialGradientLR

            anchors.centerIn: parent
            //keep parent borders visible this way
            width: parent.width-2
            height: parent.height-2

            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightgreen" }
                GradientStop { position: 0.5; color: "green" }
            }
            visible: false
        }

        Text {
            id: textLR
            text: qsTr("LR")
            anchors.centerIn: parent
            font.pixelSize: 16
            font.bold: true
            color: "white"
        }

        MouseArea {
            property var lr_active: false
            anchors.fill: parent
            onClicked: {
                if (lr_active) {
                    radialGradientLR.visible = false
                    textLR.color = "white"
                    textLR.font.bold = true
                }
                else {
                    radialGradientLR.visible = true
                    textLR.color = "black"
                    textLR.font.bold = false
                }
                lr_active = !lr_active
                console.log("button LR pressed")
            }
        }
    }

    Meter {
        id: meterL
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -190
        anchors.top: parent.top
        anchors.topMargin: 17

        Dial {
            x: 125
            y: 215
            width: 70
            height: 70
            stepSize: 1
            tickmarksVisible: true
            maximumValue: 2

            anchors {
                horizontalCenter: meterL.horizontalCenter
                top: meterL.bottom
                topMargin: 35
            }

            Rectangle {
                width: parent.width + 2
                height: parent.height + 2
                radius: width / 2
                color: "#3b5066"
                anchors.centerIn: parent
                z: -1

                Rectangle {
                    width: 4
                    height: 4
                    radius: 2
                    color: "white"
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.top
                        bottomMargin: 2
                    }
                }

                Rectangle {
                    width: 4
                    height: 4
                    radius: 2
                    color: "white"
                    anchors {
                        centerIn: parent
                        horizontalCenter: parent.horizontalCenter
                        horizontalCenterOffset: 37
                        verticalCenterOffset: 17
                    }
                }

                Rectangle {
                    width: 4
                    height: 4
                    radius: 2
                    color: "white"
                    anchors {
                        centerIn: parent
                        horizontalCenter: parent.horizontalCenter
                        horizontalCenterOffset: -37
                        verticalCenterOffset: 17
                    }
                }
            }

            Text {
                color: "#eeeeec"
                text: qsTr("TRIM LEFT")
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 16
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.top
                    bottomMargin: 7
                }
            }

            Rectangle {
                width: 38
                height: 16
                radius: 8
                color: "#3b5066"

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.bottom
                    topMargin: 4
                }

                Text {
                    text: qsTr("6.5")
                    color: "white"
                    font.bold: true
                    anchors.centerIn: parent
                }
            }
        }
    }

    //***********************************************************

    Meter {
        id: meterR
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 190
        anchors.top: parent.top
        anchors.topMargin: 17
    }

    Dial {
        width: 70
        height: 70
        stepSize: 1
        tickmarksVisible: true
        maximumValue: 3

        anchors {
            horizontalCenter: meterR.horizontalCenter
            top: meterR.bottom
            topMargin: 35
        }

        Rectangle {
            width: parent.width + 2
            height: parent.height + 2
            radius: width / 2
            color: "#3b5066"
            anchors.centerIn: parent
            z: -1

            Rectangle {
                width: 4
                height: 4
                radius: 2
                color: "white"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.top
                    bottomMargin: 2
                }
            }

            Rectangle {
                width: 4
                height: 4
                radius: 2
                color: "white"
                anchors {
                    centerIn: parent
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: 37
                    verticalCenterOffset: 17
                }
            }

            Rectangle {
                width: 4
                height: 4
                radius: 2
                color: "white"
                anchors {
                    centerIn: parent
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: -37
                    verticalCenterOffset: 17
                }
            }
        }

        Text {
            color: "#eeeeec"
            text: qsTr("TRIM RIGHT")
            font.bold: true
            font.pixelSize: 16
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.top
                bottomMargin: 7
            }
        }

        Rectangle {
            width: 38
            height: 16
            radius: 8
            color: "#3b5066"

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
                topMargin: 4
            }

            Text {
                text: qsTr("4.5")
                color: "white"
                font.bold: true
                anchors.centerIn: parent
            }
        }
    }

    RowLayout {
        anchors {
            horizontalCenter:  parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 15
        }

        Rectangle {
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
                width: 65
                height: 65
                anchors {
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 15
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: -parent.width/4
                }

                Rectangle {
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
                width: 24
                height: 24
                radius: 12
                color: "#a9a9a9"
                border.color: "darkgrey"
                border.width: 1

                anchors {
                    top: parent.top
                    topMargin: 4
                    right: parent.right
                    rightMargin: 4
                }

                Rectangle {
                    id: centerbuttonlight
                    width: 14
                    height: 14
                    radius: 7
                    color: "#85d485"
                    visible: false
                    anchors.centerIn: parent
                }

                Image {
                    id: imagePowerButton
                    visible: true
                    height:18
                    width: 18

                    source: "img/power.png"
                    opacity: 0.6

                    anchors.centerIn: parent
                    anchors.verticalCenterOffset:-1
                }

                MouseArea {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    property var ledstatus: false

                    onClicked: {
                        //parent.color = (parent.color == "#a9a9a9") ? "#32cd32" : "#a9a9a9"
                        ledstatus = !ledstatus
                        //parent.color = ledstatus ? "#32cd32" : "#a9a9a9"
                        if (ledstatus == true) {
                            parent.color = "#32cd32"
                            centerbuttonlight.visible = true;
                        }
                        else {
                            parent.color = "#a9a9a9"
                            centerbuttonlight.visible = false;
                        }


                    }
                }
            }
        }

        Rectangle {
            width: 240
            height: 140
            color: "#3b5066"
            radius: 10

            Layout.fillHeight: true
            Layout.fillWidth: true

            border.width: 0
            anchors.bottomMargin: 200

            Text {
                text: "DYN EQ"
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
                width: 65
                height: 65

                anchors {
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 15
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: -parent.width/4
                }

                Rectangle {
                    height: 20
                    width: 45
                    radius: 10
                    color: "slategrey"
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        horizontalCenterOffset: -22
                        verticalCenter: textFreqOfDynEq.verticalCenter
                    }

                    Text {
                        text: qsTr("BP n")
                        font.pixelSize: 14
                        font.bold: true
                        color: "white"
                        anchors.centerIn: parent
                    }
                }

                Text {
                    id: textFreqOfDynEq
                    text: qsTr("FREQ")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        horizontalCenterOffset: 22
                        bottom: parent.top
                    }
                }

                Text {
                    text: qsTr("2736")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                    }
                }
            }

            Dial {
                width: 65
                height: 65
                tickmarksVisible: true

                anchors {
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 15
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: parent.width/4
                }

                Text {
                    text: qsTr("DEPTH")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.top
                        bottomMargin: 2
                    }
                }

                Text {
                    text: qsTr("100")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                    }
                }
            }

            Rectangle {
                width: 24
                height: 24
                radius: 12
                color: "#a9a9a9"
                border.color: "darkgrey"
                border.width: 1

                anchors {
                    top: parent.top
                    topMargin: 4
                    right: parent.right
                    rightMargin: 4
                }

                Rectangle {
                    id: centerbuttonlight2
                    width: 14
                    height: 14
                    radius: 7
                    color: "#85d485"
                    visible: false
                    anchors.centerIn: parent
                }

                Image {
                    visible: true
                    height:18
                    width: 18

                    source: "img/power.png"
                    opacity: 0.6

                    anchors.centerIn: parent
                    anchors.verticalCenterOffset:-1
                }

                MouseArea {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    property var ledstatus: false

                    onClicked: {
                        //parent.color = (parent.color == "#a9a9a9") ? "#32cd32" : "#a9a9a9"
                        ledstatus = !ledstatus
                        //parent.color = ledstatus ? "#32cd32" : "#a9a9a9"
                        if (ledstatus == true) {
                            parent.color = "#32cd32"
                            centerbuttonlight2.visible = true;
                        }
                        else {
                            parent.color = "#a9a9a9"
                            centerbuttonlight2.visible = false;
                        }
                    }
                }
            }
        }

        Rectangle {
            width: 240
            height: 140
            color: "#3b5066"
            radius: 10

            Layout.fillHeight: true
            Layout.fillWidth: true

            border.width: 0
            anchors.bottomMargin: 200

            Text {
                text: "MONO MAKER"
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
                width: 65
                height: 65

                anchors {
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 15
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: -parent.width/4
                }

                Text {
                    text: qsTr("FREQ")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.top
                    }
                }

                Text {
                    text: qsTr("80")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                    }
                }
            }

            Dial {
                width: 65
                height: 65
                tickmarksVisible: true

                anchors {
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 15
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: parent.width/4
                }

                Text {
                    text: qsTr("AMOUNT")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.top
                        bottomMargin: 2
                    }
                }

                Text {
                    text: qsTr("100")
                    color: "white"
                    font.bold: true
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                    }
                }
            }

            Rectangle {
                width: 24
                height: 24
                radius: 12
                color: "#a9a9a9"
                border.color: "darkgrey"
                border.width: 1

                anchors {
                    top: parent.top
                    topMargin: 4
                    right: parent.right
                    rightMargin: 4
                }

                Rectangle {
                    id: centerbuttonlight3
                    width: 14
                    height: 14
                    radius: 7
                    color: "#85d485"
                    visible: false
                    anchors.centerIn: parent
                }

                Image {
                    visible: true
                    height:18
                    width: 18

                    source: "img/power.png"
                    opacity: 0.6

                    anchors.centerIn: parent
                    anchors.verticalCenterOffset:-1
                }

                MouseArea {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    property var ledstatus: false

                    onClicked: {
                        //parent.color = (parent.color == "#a9a9a9") ? "#32cd32" : "#a9a9a9"
                        ledstatus = !ledstatus
                        //parent.color = ledstatus ? "#32cd32" : "#a9a9a9"
                        if (ledstatus == true) {
                            parent.color = "#32cd32"
                            centerbuttonlight3.visible = true;
                        }
                        else {
                            parent.color = "#a9a9a9"
                            centerbuttonlight3.visible = false;
                        }
                    }
                }
            }
        }
    }
}
