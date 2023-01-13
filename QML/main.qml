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
