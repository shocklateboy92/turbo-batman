import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Item {
    id: root
    height: col_main.height

    property bool expanded: false

    SystemPalette {
        id: palette
    }

    Rectangle {
        id: highlight
        color: palette.window
        anchors.fill: parent
        visible: mouseArea.containsMouse
//        radius: 3
    }

    Column {
        id: col_main
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }

        RowLayout {
            width: root.width
            height: sizes.mHeight(3)
            spacing: sizes.mWidth(2)

            Text {
                text: name
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                color: palette.text
                font.pointSize: 18
                Layout.minimumWidth: Math.max(sizes.mWidth(45), paintedWidth)
            }
            Text {
                height: parent.height
                text: short_description.trim()
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                color: palette.text
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
            Item {
                height: parent.height
                width: expand_text.paintedWidth

                //TODO: add icon
                Text {
                    id: expand_text
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    text: "Details"
                }
                visible: mouseArea.containsMouse
            }
        }
        Loader {
            id: loader_Text
            sourceComponent: component_Description
            active: root.expanded
            visible: root.expanded
            width: root.width
        }

        Component {
            id: component_Description
            Text {
                text: full_text
                wrapMode: Text.Wrap
            }
        }
    }


    Item {
        height: 1
        width: parent.width
        anchors.bottom: parent.bottom

        Rectangle {
            id: bottom_separator
            height: parent.width
            width: 1
            rotation: 90
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#00000000"
                }

                GradientStop {
                    position: 0.15
                    color: palette.mid
                }
                GradientStop {
                    position: 0.85
                    color: palette.mid
                }

                GradientStop {
                    position: 1
                    color: "#00000000"
                }
            }
        }
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: {
            root.expanded = !root.expanded;
        }
    }
}
