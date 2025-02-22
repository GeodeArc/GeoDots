import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: loginButton
    hoverEnabled: true
    width: 30
    height: 24

    Text {
        id: loginText
        color: "white"
        text: String.fromCodePoint(0xebe7)
        font.family:  Qt.resolvedUrl("../fonts") ? "Segoe Fluent Icons" : iconfont.name
        font.pointSize: 11
        renderType: Text.NativeRendering
        anchors.centerIn: parent
    }

    background: Rectangle {
        id: loginbuttonBackground
        width: parent.width
        height: parent.height
        color: "transparent"
        radius: 4
    }

    states: [
       State {
            name: "pressed"
            when: loginButton.down
            PropertyChanges {
                target: loginbuttonBackground
                color: config.color
                width: 32
                height: 26
                x: -1
                y: -1
            }
            PropertyChanges {
                target: loginText
                color: "black"
            }
        },

        State {
            name: "hovered"
            when: loginButton.hovered
            PropertyChanges {
                target: loginbuttonBackground
                color: config.color
            }
            PropertyChanges {
                target: loginText
                color: "black"
            }
        }
    ]
}
