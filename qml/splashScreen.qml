import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
// import QtQuick.Controls.Material 2.15
import QtQuick.Timeline 1.0
import "components"


Window {
    id: splahScreen
    width: 380
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("hello")

    //Remove Title Bar
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    Rectangle {
        id: bg
        x: 109
        y: 190
        width: 360
        height: 560
        color: "#1c1d20"
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1

        CircularProgressBar {
            id: circularProgressBar
            x: 55
            y: 194
            opacity: 0
            visible: true
            text: "%"
            anchors.verticalCenter: parent.verticalCenter
            textColor: "#7e7e7e"
            progressColor: "#1e357b"
            progressWidth: 10
            textSize: 12
            strokeBgWidth: 6
            value: 100
            anchors.horizontalCenter: parent.horizontalCenter

        }

        Image {
            id: logoImage
            x: 47
            width: 300
            height: 120
            opacity: 1
            visible: true
            anchors.top: parent.top
            source: "../images/svg_images/user-shield-solid.svg"
            anchors.topMargin: 45
            sourceSize.width: 120
            sourceSize.height: 120
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }


        Label {
            id: label
            x: 48
            y: 311
            opacity: 1
            color: "#ffffff"
            text: qsTr("Login to App")
            anchors.bottom: label1.top
            anchors.bottomMargin: 10
            font.family: "Segoe UI"
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: label1
            x: 55
            y: 349
            opacity: 0
            color: "#ffffff"
            text: qsTr("Username or email address and password")
            anchors.bottom: textUsername.top
            anchors.bottomMargin: 15
            anchors.horizontalCenterOffset: 0
            font.family: "Segoe UI"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }



        CustomTextField {
            id: textUsername
            x: 30
            y: 387
            opacity: 0
            anchors.bottom: textPassword.top
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Username or email"
        }

        CustomTextField {
            id: textPassword
            x: 30
            y: 438
            opacity: 1
            anchors.bottom: btnLogin.top
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Password"
            echoMode: TextInput.Password
        }

        CustomButton {
            id: btnLogin
            x: 30
            y: 484
            width: 300
            height: 40
            opacity: 0
            text: "Login"
            anchors.bottom: parent.bottom
            font.pointSize: 10
            font.family: "Segoe UI"
            colorPressed: "#182752"
            colorMouseOver: "#1a2a58"
            colorDefault: "#1e357b"
            anchors.bottomMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: backend.checkLogin(textUsername.text, textPassword.text)
        }

        Connections{
            target: backend

            //Custom Property
            property string username: ""
            property string password: ""
            property int id: -1
            // function onSignalUser(myUser){ username = myUser }
            // function onSignalPass(myPass){ password = myPass }
            // function onSignalId(myId){ id = myId }

            //Function Open NewWindow
            function onSignalLogin(boolValue){
                if(boolValue){
                                var component = Qt.createComponent("mainWindow.qml")
                                var win = component.createObject()
                                // win.textUsername = username
                                // win.textPassword = password
                                // win.textId = id
                                win.show()
                                visible = false
                            } else{
                                // CHANGE USER COLOR
                                textUsername.Material.foreground = Material.Pink
                                textUsername.Material.accent = Material.Pink
                                textPassword.Material.foreground = Material.Pink
                                textPassword.Material.accent = Material.Pink
                            }
            }
        }

        CustomButton {
            id: btnClose
            x: 36
            width: 30
            height: 30
            opacity: 1
            text: "X"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 15
            anchors.topMargin: 15
            colorPressed: "#182752"
            colorDefault: "#1e357b"
            font.family: "Segoe UI"
            font.pointSize: 10
            colorMouseOver: "#1a2a58"
            onClicked: splahScreen.close()
        }


    }

    DropShadow{
        anchors.fill: bg
        source: bg
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#60000000"
        z: 0
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 3000
                running: true
                loops: 1
                to: 3000
                from: 0
            }
        ]
        startFrame: 0
        enabled: true
        endFrame: 3000

        KeyframeGroup {
            target: circularProgressBar
            property: "value"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                value: 100
                frame: 1300
            }
        }

        KeyframeGroup {
            target: circularProgressBar
            property: "opacity"
            Keyframe {
                value: 1
                frame: 1302
            }

            Keyframe {
                value: 0
                frame: 1798
            }

            Keyframe {
                value: 1
                frame: 0
            }
        }

        KeyframeGroup {
            target: logoImage
            property: "opacity"
            Keyframe {
                value: 0
                frame: 1798
            }

            Keyframe {
                value: 1
                frame: 2300
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: label
            property: "opacity"
            Keyframe {
                value: 0
                frame: 1902
            }

            Keyframe {
                value: 1
                frame: 2397
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: label1
            property: "opacity"
            Keyframe {
                value: 1
                frame: 2500
            }

            Keyframe {
                value: 0
                frame: 1998
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: textUsername
            property: "opacity"
            Keyframe {
                value: 1
                frame: 2600
            }

            Keyframe {
                value: 0
                frame: 2101
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: textPassword
            property: "opacity"
            Keyframe {
                value: 0
                frame: 2197
            }

            Keyframe {
                value: 1
                frame: 2700
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: btnLogin
            property: "opacity"
            Keyframe {
                value: 1
                frame: 2800
            }

            Keyframe {
                value: 0
                frame: 2301
            }

            Keyframe {
                value: 0
                frame: 0
            }
        }

        KeyframeGroup {
            target: bg
            property: "height"
            Keyframe {
                value: 360
                frame: 1302
            }

            Keyframe {
                easing.bezierCurve: [0.222,-0.00349,0.218,1,1,1]
                value: 560
                frame: 1902
            }

            Keyframe {
                value: 360
                frame: 0
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
