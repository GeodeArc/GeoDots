import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import QtMultimedia
import "Components"

Item {
    id: root
    width: Screen.width
    height: Screen.height

    FontLoader {
        id: segoeui
        source: Qt.resolvedUrl("fonts/Segoe-UI-Variable-Static-Display.ttf")
    }

    FontLoader {
        id: segoeuisb
        source: Qt.resolvedUrl("fonts/Segoe-UI-Variable-Static-Display-Semibold.ttf")
    }

    FontLoader {
        id: iconfont
        source: Qt.resolvedUrl("fonts/Segoe-Fluent-Icons.ttf")
    }

    Rectangle {
        id: background
        anchors.fill: parent
        width: parent.width
        height: parent.height

        Image {
            id: bgimg
            anchors.fill: parent
            width: parent.width
            height: parent.height
            source: config.background
            visible: false
        }

        MediaPlayer {
            id: startupSound
            autoPlay: true
            source: Qt.resolvedUrl("Assets/Startup-Sound.wav")
            audioOutput: AudioOutput {}
        }

        GaussianBlur {
            anchors.fill: bgimg
            source: bgimg
            radius: 60
            samples: 50
        }

        Rectangle {
            anchors.fill: parent
            width: parent.width
            height: parent.height
            color: "#1A000000"
        }
    }

    Rectangle {
        id: startupBg
        width: Screen.width
        height: Screen.height
        color: "transparent"
        z: 4

        Image {
            anchors.fill: parent
            width: Screen.width
            height: Screen.height
            smooth: true
            source: config.background
        }

        Rectangle {
            anchors.fill: parent
            width: parent.width
            height: parent.height
            color: "#1A000000"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            drag.target: timeDate
            drag.axis: Drag.YAxis
            drag.minimumY: -Screen.height / 2
            drag.maximumY: 0
            focus: true

            onClicked: {
                listView.focus = true
                mouseArea.focus = false
                mouseArea.enabled = false
                seqStart.start()
                parStart.start()
            }

            Keys.onPressed: {
                listView.focus = true
                mouseArea.focus = false
                mouseArea.enabled = false
                seqStart.start()
                parStart.start()
            }

            property bool dragActive: drag.active

            onDragActiveChanged: {
                if(drag.active) {}
                else {
                    listView.focus = true
                    mouseArea.focus = false
                    mouseArea.enabled = false
                    seqStart.start()
                    parslideStart.start()
                }
            }
        }

        ParallelAnimation {
            id: parStart
            running: false

            NumberAnimation {
                target: timeDate
                properties: "y"
                from: 0
                to: -100
                duration: 150
            }

            NumberAnimation {
                target: timeDate
                properties: "visible"
                from: 1
                to: 0
                duration: 175
            }

            NumberAnimation {
                target: startupBg
                properties: "opacity"
                from: 1
                to: 0
                duration: 180
            }
        }

        ParallelAnimation {
            id: parslideStart
            running: false

            NumberAnimation {
                target: startupBg
                properties: "opacity"
                from: 1
                to: 0
                duration: 100
            }
        }

        SequentialAnimation {
            id: seqStart
            running: false

            ParallelAnimation {

                ScaleAnimator {
                    target: background
                    from: 1
                    to: 1.01
                    duration: 250
                }

                NumberAnimation {
                    target: centerPanel
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 225
                }

                NumberAnimation {
                    target: rightPanel
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 100
                }

                NumberAnimation {
                    target: leftPanel
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 100
                }
            }
        }

        Rectangle {
            id: timeDate
            width: parent.width
            height: parent.height
            color: "transparent"

            Column {
                id: timeContainer

                anchors {
                    top: parent.top
                    topMargin: 145
                    horizontalCenter: parent.horizontalCenter
                }

                property date dateTime: new Date()

                Timer {
                    interval: 100; running: true; repeat: true;
                    onTriggered: timeContainer.dateTime = new Date()
                }

                Text {
                    id: time

                    color: "white"
                    font.pointSize: 94
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering
                    text: Qt.formatTime(timeContainer.dateTime, "hh:mm")

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle {
                    id: spacingRect
                    color: "transparent"
                    width: 5
                    height: 5

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Text {
                    id: date

                    color: "white"
                    font.pointSize: 19
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignLeft
                    text: Qt.formatDate(timeContainer.dateTime, "dddd, d MMMM")

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                FontLoader {
                    id: localsys
                    source: "/usr/local/share/fonts/s/Segoe_Fluent_Icons.ttf"
                }

                Text {
                    id: warning
                    visible: {
                        if (segoeui.status === FontLoader.Error && localsys.status === FontLoader.Error) return true

                        return false
                    }

                    color: "white"
                    font.pointSize: 19
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignLeft
                    text: "Please install the required fonts!"
                    topPadding: 75
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Text {
                    id: warning2
                    visible: warning.visible ? true : false

                    color: "white"
                    font.pointSize: 19
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignLeft
                    text: "Check the Github repo from 'https://github.com/birbkeks/win11-sddm-theme' "
                    topPadding: 50

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Text {
                    id: warning3
                    visible: warning.visible ? true : false

                    color: "white"
                    font.pointSize: 19
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignLeft
                    text: "or run '/usr/share/sddm/themes/win11-sddm-theme/install.sh' in your terminal!"

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Text {
                    id: warning4
                    visible: warning.visible ? true : false

                    color: "white"
                    font.pointSize: 19
                    font.family: Qt.resolvedUrl("../fonts") ? "Segoe UI Variable Static Display" : segoeuisb.name
                    font.weight: Font.DemiBold
                    renderType: Text.NativeRendering
                    horizontalAlignment: Text.AlignLeft
                    text: "I can't include those fonts in my project because of legal issues with Microsoft!"
                    topPadding: 50

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }

    Item {
        id: rightPanel
        z: 2
        opacity: 0

        anchors {
            bottom: parent.bottom
            right: parent.right
            margins: 65
        }

        PowerPanel {
            id: powerPanel
        }

        SessionPanel {
            id: sessionPanel

            anchors {
                right: powerPanel.left
                rightMargin: 10
            }
        }

        LayoutPanel {
            id: layoutPanel

            anchors {
                right: sessionPanel.left
                rightMargin: 10
            }
        }
    }

    Rectangle {
        id: leftPanel
        color: "transparent"
        anchors.fill: parent
        z: 2
        opacity: 0

        visible: listView2.count > 1 ? true : false
        enabled: listView2.count > 1 ? true : false

        Component {
            id: userDelegate2

            UserList {
                id: userList
                name: (model.realName === "") ? model.name : model.realName
                icon: "/var/lib/AccountsService/icons/" + name

                anchors {
                    horizontalCenter: parent.horizontalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listView2.currentIndex = index
                        listView2.focus = true
                        listView.currentIndex = index
                        listView.focus = true
                    }
                }
            }
        }

        Rectangle {
            width: 150
            height: listView2.count > 17 ? Screen.height - 68 : 58 * listView2.count
            color: "transparent"
            clip: true

            anchors {
                bottom: parent.bottom
                bottomMargin: 35
                left: parent.left
                leftMargin: 35
            }

            Item {
                id: usersContainer2
                width: 255
                height: parent.height

                anchors {
                    bottom: parent.bottom
                    left: parent.left
                }

                Button {
                    id: prevUser2
                    visible: true
                    enabled: false
                    width: 0

                    anchors {
                        bottom: parent.bottom
                        left: parent.left
                    }
                }

                ListView {
                    id: listView2
                    height: parent.height
                    focus: true
                    model: userModel
                    currentIndex: userModel.lastIndex
                    delegate: userDelegate2
                    verticalLayoutDirection: ListView.TopToBottom
                    orientation: ListView.Vertical
                    interactive: listView2.count > 17 ? true : false

                    anchors {
                        left: prevUser2.right
                        right: nextUser2.left
                    }
                }

                Button {
                    id: nextUser2
                    visible: true
                    width: 0
                    enabled: false

                    anchors {
                        bottom: parent.bottom
                        right: parent.right
                    }
                }
            }
        }
    }

    Item {
        id: centerPanel
        anchors.centerIn: root
        z: 2
        opacity: 0

        Item {

            Component {
                id: userDelegate

                UserPanel {
                    anchors.centerIn: parent
                    name: (model.realName === "") ? model.name : model.realName
                    icon: "/var/lib/AccountsService/icons/" + name
                }
            }

            Button {
                id: prevUser
                anchors.left: parent.left
                enabled: false
                visible: false
            }

            ListView {
                id: listView
                focus: true
                model: userModel
                delegate: userDelegate
                currentIndex: userModel.lastIndex
                interactive: false

                anchors {
                    left: prevUser.right
                    right: nextUser.left
                }
            }

            Button {
                id: nextUser
                anchors.right: parent.right
                enabled: false
                visible: false
            }
        }
    }
}
