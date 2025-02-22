import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: revealButton
    hoverEnabled: true
    width: 26
    height: 22

    Text {
        id: revealText
        color: "white"
        text: String.fromCodePoint(0xe18b)
        font.family: Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
        font.pointSize: 10
        renderType: Text.NativeRendering
        anchors.centerIn: parent
    }

    background: Rectangle {
        id: revealButtonBackground
        color: "transparent"
        radius: 4

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }

    states: [
        State {
            name: "on"
            when: revealButton.down
            PropertyChanges {
                target: passwordField
                echoMode: TextInput.Normal
            }
            PropertyChanges {
                target: passwordFieldPin
                echoMode: TextInput.Normal
            }
            PropertyChanges {
                target: revealText
                color: "white"
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: passwordField
                echoMode: TextInput.Password
            }
            PropertyChanges {
                target: passwordFieldPin
                echoMode: TextInput.Password
            }
        },
        State {
            name: "hovered"
            when: revealButton.hovered
            PropertyChanges {
                target: revealButtonBackground
                color: "#15FFFFFF"
            }
        }
    ]
}
