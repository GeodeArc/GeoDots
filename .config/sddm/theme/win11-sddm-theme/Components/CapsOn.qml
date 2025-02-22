import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: capsButton

    color: "transparent"

    x: -50

    Text {
        color: "white"
        font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
        text: "Caps Lock is on"
        renderType: Text.NativeRendering
        font.weight: Font.Bold
        font.pointSize: 12
    }
}


