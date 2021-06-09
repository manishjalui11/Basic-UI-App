import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainwindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: "AppMainWindow"

    Rectangle {
        id: bg
        y: 218
        color: "#000a1a"
        border.color: "#090909"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#000d33"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
            }

            Rectangle {
                    id: menuBtn
                    height: 60
                    width: 70
                    color: "#3366ff"
                    anchors.left: topBar.left
                    anchors.top: topBar.top
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                }

            Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#000d33"
                    anchors.left: parent.left
                    anchors.top: topBar.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:3}D{i:5}D{i:4}D{i:2}D{i:1}
}
##^##*/
