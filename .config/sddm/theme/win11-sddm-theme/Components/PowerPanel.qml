import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    Button {
        id: powerButton
        width: 40
        height: powerButton.width
        hoverEnabled: true

        Text {
            color: "white"
            font.family:  Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
            text: String.fromCodePoint(0xe7e8)
            renderType: Text.NativeRendering
            font.pointSize: 13
            anchors.centerIn: powerButton
        }

        ToolTip {
            id: powerButtonTip

            delay: 1000
            timeout: 4800
            leftPadding: 9
            rightPadding: 9
            topPadding: 7
            bottomPadding: 7
            y: powerButton.height + 5
            z: 2
            visible: powerButton.hovered

            contentItem: Text {
                text: "Power"
                font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                renderType: Text.NativeRendering
                color: "white"
            }

            background: Rectangle {
                color: "#2A2A2A"
                border.width: 1
                border.color: "#1A1A1A"
            }
        }

        background: Rectangle {
            id: powerButtonBackground
            color: "transparent"
            radius: 5
        }

        states: [
            State {
                name: "pressed"
                when: powerButton.down
                PropertyChanges {
                    target: powerButtonBackground
                    color: "#50FFFFFF"
                }
            },

            State {
                name: "hovered"
                when: powerButton.hovered
                PropertyChanges {
                    target: powerButtonBackground
                    color: "#25FFFFFF"
                }
            },

            State {
                name: "selection"
                when: powerPopup.visible
                PropertyChanges {
                    target: powerButtonBackground
                    color: "transparent"
                }
            }
        ]

        onClicked: {
            powerPopup.visible ? powerPopup.close() : powerPopup.open()
            powerPopup.visible === powerPopup.open ; powerButton.state = "selection"
            powerButtonTip.hide()
        }
    }

    Popup {
        id: powerPopup
        width: 133
        height: poweroffButton.height + rebootButton.height + sleepButton.height + 40
        x: Math.round((powerButton.width - width) / 2) - 22
        y: -135
        z: 3
        topPadding: 10

        background: Rectangle {
            color: "#E02B2E2C"
            border.color: "#E6121212"
            border.width: 1
            radius: 5
        }

        Button {
            id: poweroffButton
            width: 115
            height: 30
            hoverEnabled: true

            background: Rectangle {
                id: poweroffButtonBackground
                color: "transparent"
                radius: 5
                width: parent.width
                height: parent.height

                anchors {
                    right: parent.right
                    rightMargin: -5
                }
            }

            ToolTip {
                id: poweroffTip

                delay: 1000
                timeout: 4800
                leftPadding: 9
                rightPadding: 9
                topPadding: 7
                bottomPadding: 7
                visible: poweroffButton.hovered

                contentItem: Text {
                    text: "Closes all apps and turns off the PC."
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                    renderType: Text.NativeRendering
                    color: "white"
                }

                background: Rectangle {
                    color: "#2A2A2A"
                    border.width: 1
                    border.color: "#1A1A1A"
                }
            }

            Text {
                id: powerText
                text: "Shut down"
                color: "white"

                font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                font.pointSize: 10.5
                leftPadding: 10
                renderType: Text.NativeRendering

                anchors {
                    left: poweroffIcon.right
                    verticalCenter: poweroffButton.verticalCenter
                }
            }

            Text {
                id: poweroffIcon
                color: "white"
                font.family:  Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
                text: String.fromCodePoint(0xe7e8)
                renderType: Text.NativeRendering
                font.pointSize: 11
                font.weight: Font.Bold

                anchors {
                    right: poweroffButton.left
                    rightMargin: -30
                    verticalCenter: poweroffButton.verticalCenter
                }
            }


            states: [
                State {
                    name: "hovered"
                    when: poweroffButton.hovered
                    PropertyChanges {
                        target: poweroffButtonBackground
                        color: "#15FFFFFF"
                    }
                }
            ]

            onClicked: sddm.powerOff()
        }

        Button {
            id: rebootButton
            width: 115
            height: 30
            hoverEnabled: true

            anchors {
                topMargin: 10
                top: poweroffButton.bottom
                right: parent.right
                rightMargin: 2
            }

            background: Rectangle {
                id: rebootButtonBackground
                color: "transparent"
                radius: 5
                width: parent.width
                height: parent.height
            }

            ToolTip {
                id: rebootButtonTip

                delay: 1000
                timeout: 4800
                leftPadding: 9
                rightPadding: 9
                topPadding: 7
                bottomPadding: 7
                visible: rebootButton.hovered

                contentItem: Text {
                    text: "Closes all apps, turns off the PC, and then turns it on
again."             // I had to make it like this, so it's normal, don't touch.
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                    renderType: Text.NativeRendering
                    color: "white"
                }

                background: Rectangle {
                    color: "#2A2A2A"
                    border.width: 1
                    border.color: "#1A1A1A"
                }
            }

            Text {
                id: rebootText
                text: "Restart"
                color: "white"

                font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                font.pointSize: 10.5
                leftPadding: 10
                renderType: Text.NativeRendering

                anchors {
                    left: rebootIcon.right
                    verticalCenter: parent.verticalCenter
                }
            }

            Text {
                id: rebootIcon
                color: "white"
                font.family:  Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
                text: String.fromCodePoint(0xe777)
                renderType: Text.NativeRendering
                font.pointSize: 11
                font.weight: Font.Bold

                anchors {
                    right: rebootButton.left
                    rightMargin: -25
                    verticalCenter: rebootButton.verticalCenter
                }
            }

            states: [
                State {
                name: "hovered"
                when: rebootButton.hovered
                    PropertyChanges {
                        target: rebootButtonBackground
                        color: "#15FFFFFF"
                    }
                }
            ]

            onClicked: sddm.reboot()
        }

        Button {
            id: sleepButton
            width: 115
            height: 30
            hoverEnabled: true

            anchors {
                topMargin: 10
                top: rebootButton.bottom
                right: parent.right
                rightMargin: 2
            }

            background: Rectangle {
                id: sleepButtonBackground
                color: "transparent"
                radius: 5
                width: parent.width
                height: parent.height

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }

            ToolTip {
                id: sleepButtonTip

                delay: 1000
                timeout: 4800
                leftPadding: 9
                rightPadding: 9
                topPadding: 7
                bottomPadding: 7
                visible: sleepButton.hovered

                contentItem: Text {
                    text: "The PC stays on but uses low power. Apps stay open so
when the PC wakes up, you're instantly back to where
you left off."      // Again, it had to be like this, don't touch.
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                    renderType: Text.NativeRendering
                    color: "white"
                }

                background: Rectangle {
                    color: "#2A2A2A"
                    border.width: 1
                    border.color: "#1A1A1A"
                }
            }

            Text {
                id: sleepText
                text: "Sleep"
                color: "white"

                font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                font.pointSize: 10.5
                leftPadding: 10
                renderType: Text.NativeRendering

                anchors {
                    left: sleepIcon.right
                    verticalCenter: parent.verticalCenter
                }
            }

            Text {
                id: sleepIcon
                color: "white"
                font.family: Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
                text: String.fromCodePoint(0xe708)
                renderType: Text.NativeRendering
                font.pointSize: 11
                font.weight: Font.Bold

                anchors {
                    right: sleepButton.left
                    rightMargin: -25
                    verticalCenter: sleepButton.verticalCenter
                }
            }

            states: [
                State {
                name: "hovered"
                when: sleepButton.hovered
                    PropertyChanges {
                        target: sleepButtonBackground
                        color: "#15FFFFFF"
                    }
                }
            ]

            onClicked: sddm.suspend()
        }

        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                easing.type: Easing.OutCirc
            }
        }

        exit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                easing.type: Easing.OutCirc
            }
        }
    }
}
