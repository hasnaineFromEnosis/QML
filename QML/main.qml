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
            onClicked: console.log("Pressed")
        }

        Rectangle {
            // name this element root
            id: root

            // properties: <name>: <value>
            width: 120; height: 240

            // color property
            color: "#4A4A4A"

            // Declare a nested element (child of root)
            Text {
                    id: label

                    x: 24; y: 24

                    // custom counter property for space presses
                    property int spacePresses: 0

                    text: "Space pressed: " + spacePresses + " times"

                    // (1) handler for text changes
                    onTextChanged: console.log("text changed to:", text)

                    // need focus to receive key events
                    focus: true

                    // (2) handler with some JS
                    Keys.onSpacePressed: {
                        increment()
                    }

                    // clear the text on escape
                    Keys.onEscapePressed: {
                        label.text = ''
                    }

                    // (3) a JS function
                    function increment() {
                        spacePresses = spacePresses + 1
                    }
                }
            // Another child of root
            Text {
                // un-named element

                // reference element by id
                y: triangle.y + triangle.height + 20

                // reference root element
                width: root.width

                color: 'white'
                horizontalAlignment: Text.AlignHCenter
                text: 'Triangle'
            }
        }

        Rectangle {
               id: rect1
               x: 120; y: 240
               width: 176; height: 96
               gradient: Gradient {
                   GradientStop { position: 0.0; color: "lightsteelblue" }
                   GradientStop { position: 1.0; color: "slategray" }
               }
//               border.color: "slategray"
               Text {
                   width: 40;
                   height: 120
                   text: 'A very long text'
                   // '...' shall appear in the middle
                   elide: Text.ElideRight
                   // red sunken text styling
                   style: Text.Sunken
                   styleColor: '#FF4444'
                   // align text to the top
                   verticalAlignment: Text.AlignVCenter
                   // only sensible when no elide mode
                   // wrapMode: Text.WordWrap
               }
          }

        Rectangle {
                id: rect2
                x: 120; y: 12
                width: 76; height: 96
                color: "lightsteelblue"
                MouseArea {
                    id: area
                    width: parent.width
                    height: parent.height
                    onClicked: rect2.visible = !rect2.visible
                }
            }

        Item {
            // set width based on given background
            width: 150
            height: bg.height
            x: 210
            y: 20
            clip: true

            Image { // nice background image
                width: 300
                height: 200
                id: bg
                source: "assets/background.png"
            }

            MouseArea {
                id: backgroundClicker
                // needs to be before the images as order matters
                // otherwise this mousearea would be before the other elements
                // and consume the mouse events
                anchors.fill: parent
                onClicked: {
                    // reset our little scene
                    circle.x = 84
                    box.rotation = 0
                    triangle.rotation = 0
                    triangle.scale = 1.0
                }
            }

            Flow {
                anchors.centerIn: parent
                anchors.fill: parent
                anchors.margins: 20
                spacing: 8
                ClickableImage {
                    id: circle
                    //x: 84; y: 68
                    source: "assets/circle_blue.png"
                    antialiasing: true
                    onClicked: {
                        // increase the x-position on click
                        x += 20
                    }
                }

                ClickableImage {
                    id: box
                    //x: 164; y: 68

                    source: "assets/box_green.png"
                    antialiasing: true
                    onClicked: {
                        // increase the rotation on click
                        rotation += 15
                    }
                }

                ClickableImage {
                    id: triangle
                    //x: 248; y: 68
                    source: "assets/triangle_red.png"
                    antialiasing: true
                    onClicked: {
                        // several transformations
                        rotation += 15
                        scale += 0.05
                    }
                }
            }

            function _test_transformed() {
                circle.x += 20
                box.rotation = 15
                triangle.scale = 1.2
                triangle.rotation = -15
            }

            function _test_overlap() {
                circle.x += 40
                box.rotation = 15
                triangle.scale = 2.0
                triangle.rotation = 45
            }

        }

        Item {
            // set width based on given background
            width: 252
            height: 252
            x: 400
            y: 20
            id: gridroot
            property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]
            clip: true

            Image { // nice background image
                width: parent.width
                height: parent.height
                id: bg1
                source: "assets/background.png"
            }



            Grid{
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 4
                    Repeater {
                        model: 25
                        Rectangle {
                            width: 56; height: 56
                            property int colorIndex: Math.floor(Math.random()*3)
                            color: gridroot.colorArray[colorIndex]
                            border.color: Qt.lighter(color)
                            Text {
                                anchors.centerIn: parent
                                color: "#f0f0f0"
                                text: "Cell " + index
                            }
                        }
                    }
                }

        }

        Rectangle {
            y: 400
            width: 100
            height: 200
            color: "green"

            TLineEditV1 {
                id: input1
                text: "Input 1"
                height: 90

            }
            TLineEditV1 {
                y: 100
                height: 90
                id: input2
                text: "Input 2"

            }
        }
    }

}
