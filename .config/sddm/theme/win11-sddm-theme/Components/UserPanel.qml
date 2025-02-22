import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

FocusScope {

    property alias icon: icon.source

    property alias name: name.text

    property alias password: passwordField.text

    property alias passwordpin: passwordFieldPin.text

    property int session: sessionPanel.session

    Connections {
      target: sddm

        function onLoginFailed() {
            truePass.visible = false

            passwordField.visible = false
            passwordField.enabled = false
            passwordField.focus = false

            passwordFieldPin.visible = false
            passwordFieldPin.enabled = false
            passwordFieldPin.focus = false

            rightPanel.visible = false
            leftPanel.visible = false

            falsePass.visible = true
            falsePass.focus = true

            bootani.stop()
        }

        function onLoginSucceeded() {}
    }

    Image {
        id: icon
        width: 192
        height: 192
        smooth: true
        visible: false

        onStatusChanged: {
            if (icon.status == Image.Error)
                icon.source = "../Assets/user-192.png"
            else
                "/var/lib/AccountsService/icons/" + name
        }

        x: -(icon.width / 2)
        y: -(icon.width * 2) + (icon.width * 0.8)
    }

    OpacityMask {
        anchors.fill: icon
        source: icon
        maskSource: mask
    }

    Item {
        id: mask
        width: icon.width
        height: icon.height
        layer.enabled: true
        visible: false

        Rectangle {
            width: icon.width
            height: icon.height
            radius: width / 2
            color: "black"
        }
    }

    Text {
        id: name
        color: "white"
        font.pointSize: 27
        font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
        font.weight: Font.DemiBold
        renderType: Text.NativeRendering

        anchors {
            topMargin: 15
            horizontalCenter: icon.horizontalCenter
            top: icon.bottom
        }
    }

    PasswordField {
        id: passwordField
        visible: config.PinMode === "off" ? true : false
        enabled: config.PinMode === "off" ? true : false
        focus: config.PinMode === "off" ? true : false
        x: -135

        anchors {
            topMargin: 25
            top: name.bottom
        }

        Keys.onReturnPressed: {
            truePass.visible = true
            passwordField.visible = false
            passwordFieldPin.visible = false
            rightPanel.visible = false
            leftPanel.visible = false
            sddm.login(model.name, password, session)

            bootani.start()
        }

        Keys.onEnterPressed: {
            truePass.visible = true
            passwordField.visible = false
            passwordFieldPin.visible = false
            rightPanel.visible = false
            leftPanel.visible = false
            sddm.login(model.name, password, session)

            bootani.start()
        }
    }

    PasswordFieldPin {
        id: passwordFieldPin
        visible: config.PinMode === "off" ? false : true
        enabled: config.PinMode === "off" ? false : true
        focus: config.PinMode === "off" ? false : true

        x: -135

        validator: IntValidator { // this dude allows only numbers to be typed, if something goes wrong, blame this dude.
            bottom: 8
            top: 1000
        }

        anchors {
            topMargin: 25
            top: name.bottom
        }
    }

    FalsePass {
        id: falsePass
        visible: false

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 25
            top: name.bottom
        }
    }

    Rectangle {
        id: truePass
        color: "transparent"
        visible: false

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 25
            top: name.bottom
        }

        Text {
            id: welcome
            color: "white"
            font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
            text: "Welcome"
            renderType: Text.NativeRendering
            font.weight: Font.DemiBold
            font.pointSize: 17
            anchors.centerIn: parent

            topPadding: 125
        }

        Rectangle {
            id: trueButton
            color: "transparent"

            FontLoader {
                id: animFont
                source: Qt.resolvedUrl("../fonts/SegoeBoot-Semilight.woff")
            }

            Text {
                id: splash
                color: "white"
                text: ""
                font.family: Qt.resolvedUrl("../fonts") ? "Segoe Boot Semilight" : animFont.name
                renderType: Text.NativeRendering
                font.weight: Font.Normal
                font.pointSize: 27
                leftPadding: -25
                topPadding: 25

                visible: true
                // visible: animFont.status == FontLoader.Ready ? true : false

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                SequentialAnimation {
                    id: bootani
                    running: false
                    loops: Animation.Infinite

                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 1
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 2
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 3
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 4
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 5
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 6
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 7
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 8
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 9
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 10
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 11
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 12
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 13
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" //14
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 15
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 16
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 17
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 18
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 19
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 20
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 21
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 22
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 23
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 24
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 25
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" //26
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 27
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 28
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 29
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 30
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 31
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 32
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 33
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 34
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 35
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 36
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 37
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 38
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 39
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 40
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 41
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 42
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 43
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 44
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 45
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 46
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 47
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 48
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 49
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 50
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 51
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 52
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 53
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 54
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 55
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 56
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 57
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // sivas
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 59
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 60
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 61
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" //62
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 63
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 64
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 65
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 66
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 67
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 68
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // haha funni number
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 70
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 71
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 72
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 73
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 74
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 75
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 76
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 77
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 78
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 79
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 80
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 81
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 82
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 83
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 84
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" //85
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 86
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 87
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 88
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 89
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 90
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 91
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 92
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 93
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 94
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" //95
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 96
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 97
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 98
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 99
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 100
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 101
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 102
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 103
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 104
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 105
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 106
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 107
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 108
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 109
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 110
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 111
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 112
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 113
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 114
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 115
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 116
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 117
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 118
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 119
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 120
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 121
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 122
                        duration: 30
                    }
                    PropertyAnimation {
                        target: splash
                        property: "text"
                        to: "" // 123
                        duration: 30
                    }
                }
            }
        }


    }

    CapsOn {
        id: capsOn
        visible: false

        state: keyboard.capsLock ? "on" : "off"

        states: [
            State {
                name: "on"
                PropertyChanges {
                    target: capsOn
                    visible: true
                }
            },

            State {
                name: "off"
                PropertyChanges {
                    target: capsOn
                    visible: false
                }
            }
        ]

        anchors {
            top: passwordField.bottom
            topMargin: 25
        }
    }
}
