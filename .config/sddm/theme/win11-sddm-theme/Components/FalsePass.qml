import QtQuick 2.15
import QtQuick.Controls 2.15

FocusScope {

    Text {
        id: falseText
        text: "The password is incorrect. Try again."
        color: "white"
        font.pointSize: 11
        font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
        renderType: Text.NativeRendering
        x: -falseText.width / 2
    }

    Button {
        id: falseButton
        hoverEnabled: true
        width: 120
        height: 33

        x: 1
        y: 1

        Text {
            color: "white"
            font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
            text: "OK"
            renderType: Text.NativeRendering
            font.pointSize: 11
            anchors.centerIn: parent
        }

        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 25
            top: falseText.bottom
        }

        background: Rectangle {
            id: falseButtonBackground
            color: "#35FFFFFF"
            border.color: "#35FFFFFF"
            border.width: 2
            radius: 3
        }

        states: [
            State {
                name: "1hovered"
                when: falseButton.hovered
                PropertyChanges {
                    target: falseButtonBackground
                    border.color: "#90FFFFFF"
                }
            },
            State {
                name: "2hovered"
                when: falseBg.hovered
                PropertyChanges {
                    target: falseButtonBackground
                    border.color: "#90FFFFFF"
                }
            },
            State {
                name: "3hovered"
                when: falseBg2.hovered
                PropertyChanges {
                    target: falseButtonBackground
                    border.color: "#90FFFFFF"
                }
            }
        ]

        Button {
            id: falseBg
            hoverEnabled: true
            width: 122
            height: 35

            x: -1
            y: -1

            background: Rectangle {
                id: bgBackground
                color: "transparent"
                border.color: "black"
                border.width: 1
                radius: 3
            }
        }

        Button {
            id: falseBg2
            hoverEnabled: true
            focus: true

            x: -3
            y: -3

            width: 126
            height: 39

            background: Rectangle {
                id: bg2Background
                color: "transparent"
                border.color: "white"
                border.width: 2
                radius: 6
            }

            onClicked: {
                falsePass.visible = false

                passwordField.visible = config.PinMode === "off" ? true : false
                passwordField.enabled = config.PinMode === "off" ? true : false
                passwordField.focus = config.PinMode === "off" ? true : false

                passwordFieldPin.visible = config.PinMode === "off" ? false : true
                passwordFieldPin.enabled = config.PinMode === "off" ? false : true
                passwordFieldPin.focus = config.PinMode === "off" ? false : true

                leftPanel.visible = listView2.count > 1 ? true : false
                rightPanel.visible = true

                passwordField.text = ""

                passwordFieldPin.text = ""
            }

            Keys.onReturnPressed: {
                falsePass.visible = false

                passwordField.visible = config.PinMode === "off" ? true : false
                passwordField.enabled = config.PinMode === "off" ? true : false
                passwordField.focus = config.PinMode === "off" ? true : false

                passwordFieldPin.visible = config.PinMode === "off" ? false : true
                passwordFieldPin.enabled = config.PinMode === "off" ? false : true
                passwordFieldPin.focus = config.PinMode === "off" ? false : true

                leftPanel.visible = listView2.count > 1 ? true : false
                rightPanel.visible = true

                passwordField.text = ""

                passwordFieldPin.text = ""
            }

            Keys.onEnterPressed: {
                falsePass.visible = false

                passwordField.visible = config.PinMode === "off" ? true : false
                passwordField.enabled = config.PinMode === "off" ? true : false
                passwordField.focus = config.PinMode === "off" ? true : false

                passwordFieldPin.visible = config.PinMode === "off" ? false : true
                passwordFieldPin.enabled = config.PinMode === "off" ? false : true
                passwordFieldPin.focus = config.PinMode === "off" ? false : true

                leftPanel.visible = listView2.count > 1 ? true : false
                rightPanel.visible = true

                passwordField.text = ""

                passwordFieldPin.text = ""
            }
        }
    }
}

