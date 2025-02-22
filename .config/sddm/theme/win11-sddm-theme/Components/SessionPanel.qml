import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    property int session: sessionList.currentIndex

    implicitHeight: sessionButton.height
    implicitWidth: sessionButton.width

    DelegateModel {
        id: sessionWrapper
        model: sessionModel
        delegate: ItemDelegate {
            id: sessionEntry
            width: parent.width
            height: 25
            highlighted: sessionList.currentIndex == index
            contentItem: Text {
                renderType: Text.NativeRendering
                font.weight: Font.Normal
                font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                font.pointSize: 10
                verticalAlignment: Text.AlignVCenter
                color: "white"
                text: name

                Text {
                    id: offon
                    text: "Off"
                    color: "white"
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                    font.pointSize: 10
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering

                    anchors {
                        verticalCenter: parent.verticalCenter
                        right: sessionLever.left
                        rightMargin: 10
                    }
                }

                Button {
                    id: sessionLever
                    width: 44
                    height: 20
                    z: 3

                    anchors {
                        right: parent.right
                        rightMargin: 5
                    }

                    background: Rectangle {
                        id: sessionLeverBackground
                        color: "transparent"
                        border.color: "white"
                        border.width: 2
                        radius: 180
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            sessionList.currentIndex = index
                        }
                    }

                    Button {
                        id: leftblackLever
                        width: 10
                        height: 10

                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.left
                            leftMargin: 5
                        }

                        background: Rectangle {
                            color: "white"
                            radius: 180
                        }

                        MouseArea {
                            anchors.fill: parent

                            onClicked: {
                                sessionList.currentIndex = index
                            }
                        }
                    }

                    Button {
                        id: rightblackLever
                        width: 10
                        height: 10
                        visible: false

                        anchors {
                            verticalCenter: parent.verticalCenter
                            right: parent.right
                            rightMargin: 5
                        }

                        background: Rectangle {
                            color: "white"
                            radius: 180
                        }
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            sessionList.currentIndex = index
                        }
                    }
                }
            }

            background: Rectangle {
                id: sessionEntryBackground
                color: "transparent"
            }

            states: [
                State {
                    name: "focused"
                    when: sessionEntry.focus
                    PropertyChanges {
                        target: sessionLeverBackground
                        color: config.color
                        border.color: config.color
                    }
                    PropertyChanges {
                        target: rightblackLever
                        visible: true
                    }
                    PropertyChanges {
                        target: leftblackLever
                        visible: false
                    }
                    PropertyChanges {
                        target: offon
                        text: "On"
                    }
                },

                State {
                    name: "pressed"
                    when: sessionLever.down
                    PropertyChanges {
                        target: sessionLeverBackground
                        color: "#B5B5B5"
                    }
                }
            ]
        }
    }

    Button {
        id: sessionButton
        width: 40
        height: sessionButton.width
        hoverEnabled: true

        Text {
            color: "white"
            font.family: Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
            text: String.fromCodePoint(0xe776)
            renderType: Text.NativeRendering
            font.pointSize: 13
            anchors.centerIn: sessionButton
        }

        ToolTip {
            id: sessionButtonTip

            delay: 1000
            timeout: 4800
            leftPadding: 9
            rightPadding: 9
            topPadding: 7
            bottomPadding: 7
            y: sessionButton.height + 5
            z: 2
            visible: sessionButton.hovered

            contentItem: Text {
                text: "Session"
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
            id: sessionButtonBackground
            color: "transparent"
            radius: 5
        }

        states: [
            State {
                name: "pressed"
                when: sessionButton.down
                PropertyChanges {
                    target: sessionButtonBackground
                    color: "#50FFFFFF"
                }
            },

            State {
                name: "hovered"
                when: sessionButton.hovered
                PropertyChanges {
                    target: sessionButtonBackground
                    color: "#25FFFFFF"
                }
            },

            State {
                name: "selection"
                when: sessionPopup.visible
                PropertyChanges {
                    target: sessionButtonBackground
                    color: "transparent"
                }
            }
        ]

        onClicked: {
            sessionPopup.visible ? sessionPopup.close() : sessionPopup.open()
            sessionPopup.visible === sessionPopup.open ; sessionButton.state = "selection"
            sessionButtonTip.hide()
        }
    }

    Popup {
        id: sessionPopup
        width: 250
        x: Math.round((parent.width - width) + 70)
        y: Math.round(-sessionButton.height -(sessionPopup.height) + 35)
        z: 3

        topPadding: 10

        background: Rectangle {
            color: "#2C2C2C"
            border.width: 1
            border.color: "#111111"
            radius: 4

            Button  {
                id: screenKeyboard
                width: parent.width - 2
                height: 41
                x: 1
                y: 1
                z: 3

                visible: false // disabled for now because i have no idea how to add on screen keyboard :3
                enabled: false

                Text {
                    color: "black"
                    text: "On-Screen Keyboard"
                    renderType: Text.NativeRendering
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
                    font.pointSize: 10
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 20
                    }
                }

                states: [
                    State {
                        name: "hovered"
                        when: screenKeyboard.hovered
                        PropertyChanges {
                            target: screenKeyboardBackground
                            color: "#30000000"
                        }
                    }
                ]

                background: Rectangle {
                    id: screenKeyboardBackground
                    color: "transparent"
                }
            }
        }

        contentItem: ListView {
            id: sessionList
            implicitHeight: contentHeight + 11
            model: sessionWrapper
            currentIndex: sessionModel.lastIndex
            clip: true
            spacing: 23
            interactive: false
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
