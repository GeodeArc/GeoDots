import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Rectangle {
    id: container

    property alias name: name.text
    property alias icon: icon.source

    height: 58
    color: "transparent"

    anchors.left: parent.left

    MouseArea {
        id: rectArea
        hoverEnabled: true
        anchors.fill: parent

        onEntered: {
            if (container.focus == false)
            container.color = "#30FFFFFF";
        }

        onExited: {
            if (container.focus == false)
            container.color = "transparent";
        }
    }

    states: [
        State {
            name: "focused"
            when: container.focus
            PropertyChanges {
                target: container
                color: config.color
            }
        },
        State {
            name: "unfocused"
            when: !container.focus
            PropertyChanges {
                target: container
                color: "transparent"
            }
        }
    ]

    Item {
        id: users

        Image {
            id: icon
            width: 48
            height: 48
            smooth: true
            visible: false

            onStatusChanged: {
                if (icon.status == Image.Error)
                    icon.source = "../Assets/user-192.png"
                else
                    "/var/lib/AccountsService/icons/" + name
            }

            x: 12
            y: 5
        }

        OpacityMask {
            id: img
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
            renderType: Text.NativeRendering
            font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
            font.pointSize: 10
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            clip: true

            color: "white"

            anchors {
                verticalCenter: img.verticalCenter
                left: img.right
                leftMargin: 12
            }
        }
    }
}
