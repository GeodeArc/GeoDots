import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

TextField {
    id: passwordFieldPin
    focus: true
    visible: true
    selectByMouse: true
    placeholderText: "PIN"
    placeholderTextColor: "white"

    property alias text: passwordFieldPin.text

    echoMode: TextInput.Password ? TextInput.Password : TextInput.Normal
    selectionColor: config.color

    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
    font.pointSize: 10.5
    renderType: Text.NativeRendering

    color: "white"

    onTextChanged: {
        if (passwordFieldPin.text !== "") {
            passwordFieldPin.width = 225
            revealButton.visible = true
        }

        else {
            passwordFieldPin.width = 296
            revealButton.visible = false
        }

        if (passwordFieldPin.length > 3 ) {
            sddm.login(model.name, passwordpin, session)

            bootani.start()
        }
    }

    horizontalAlignment: TextInput.AlignLeft
    width: 296
    height: 36

    background: Rectangle {
        id: passFieldBackgroundPin
        color: "#BF1C1C1C"
        border.color: "#15FFFFFF"
        border.width: 2
        x: -5
        width: 296
        height: parent.height
        radius: 6
    }

    Rectangle {
        id: passFieldBackground2
        visible: false
        border.color: config.color
        border.width: 2
        width: 292
        height: parent.height
        radius: 6
    }

    Rectangle {
        id: passField2
        visible: false
        x: -4
        y: 33
        color: config.color
        width: 294
        radius: 6
        height: 2
    }

    OpacityMask {
        anchors.fill: passField2
        source: passField2
        maskSource: passFieldBackground2
    }

    RevealButton {
        id: revealButton
        visible: false
        y: 7

        anchors {
            right: passFieldBackgroundPin.right
            rightMargin: 7
        }
    }
}
