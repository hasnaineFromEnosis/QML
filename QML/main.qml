import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Rectangle {
        width: 200
        height: 100
        color: "yellow"

        Text {
            anchors.centerIn: parent
            text: "Hello, Rectangle!"
        }

        TapHandler {
               onTapped: {
                   parent.color = "red"
               }
        }
    }

    Rectangle {
        width: 200
        height: 100
        color: "green"
        x: 200


        Text {
            anchors.centerIn: parent
            text: "Hello, Rectangle 2!"
        }

        focus: true
            Keys.onPressed: {
                if (event.key === Qt.Key_Return) {
                    color = "blue";
                    event.accepted = true;
                }
            }
    }

    Rectangle {
        color: "lightgray"
        width: 200
        height: 100
        x: 400

        property int animatedValue: 0
        SequentialAnimation on animatedValue {
            loops: Animation.Infinite
            PropertyAnimation { to: 150; duration: 10000 }
            PropertyAnimation { to: 0; duration: 1000 }
        }

        Text {
            anchors.centerIn: parent
            text: parent.animatedValue
        }
    }

    MessageLabel {
        width: 200
        y: 200
        msgType: "debug"
    }

    MessageLabel {
        width: 200
        x: 210
        y: 200
        msgType: "warning"
        message: "this is warning"
    }

    MessageLabel {
        width: 200
        y: 200
        x: 420
        message: "A cricial warning"
        msgType: "critical"
    }



    //window containing the application
    ApplicationWindow {

        visible: true

        //title of the application
        title: qsTr("Hello World")
        width: 640
        height: 480

        //menu containing two menu items
        menuBar: MenuBar {
            Menu {
                title: qsTr("File")
                MenuItem {
                    text: qsTr("&Open")
                    onTriggered: console.log("Open action triggered");
                }
                MenuItem {
                    text: qsTr("Exit")
                    onTriggered: Qt.quit();
                }
            }
        }

        //Content Area

        //a button in the middle of the content area
        Button {
            text: qsTr("Hello World")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}
