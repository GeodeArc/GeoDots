import QtQuick 6.7
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

TextField {
    id: passwordField
    focus: true
    visible: true
    selectByMouse: true
    placeholderText: "Password"
    placeholderTextColor: "white"

    property alias text: passwordField.text

    echoMode: TextInput.Password ? TextInput.Password : TextInput.Normal
    selectionColor: config.color

    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeui.name
    font.pointSize: 10.5
    renderType: Text.NativeRendering

    color: "white"

    onTextChanged: {
        if (passwordField.text !== "") {
            passwordField.width = 225
            revealButton.visible = true
        }

        else {
            passwordField.width = 296
            revealButton.visible = false
        }
    }

    horizontalAlignment: TextInput.AlignLeft
    width: 296
    height: 36

    background: Rectangle {
        id: passFieldBackground
        visible: true
        color: "#B31C1C1C"
        border.color: "#25FFFFFF"
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

    LoginButton {
        id: loginButton
        visible: true

        y: 6

        anchors {
            right: passFieldBackground.right
            rightMargin: 6
        }

        ToolTip {
            id: loginButtonTip

            delay: 1000
            timeout: 4800
            leftPadding: 9
            rightPadding: 9
            topPadding: 7
            bottomPadding: 7
            visible: loginButton.hovered

            contentItem: Text {
                text: "Submit"
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

        onClicked: {
            truePass.visible = true
            passwordField.visible = false
            passwordFieldPin.visible = false
            rightPanel.visible = false
            leftPanel.visible = false
            sddm.login(model.name, password, session)
            loginButtonTip.hide()

            bootani.start()
        }
    }

    RevealButton {
        id: revealButton
        visible: false
        y: 7

        anchors {
            right: loginButton.left
            rightMargin: 4
        }
    }
}
