import QtQuick 2.0

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1

import org.lasath.turbo_batman 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Turbo Batman")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical

        SplitView {
            orientation: Qt.Horizontal
            Layout.fillHeight: true

            Item {
                Rectangle {
                    color: "white"
                    radius: 3
                    anchors.fill: parent
                    anchors.margins: 10
                }

                Layout.fillWidth: true
                MainSheet {
                    anchors.fill: parent
                    anchors.margins: 20
                }
            }

            Item {
                width: parent.width * 0.4
                GroupBox {
                    anchors.fill: parent
                    anchors.margins: 10
                    title: "Conditions"

                }
            }
        }

        Item {
            height: 400
            GroupBox {
                title: "Modifiers"
                anchors.margins: 10
                anchors.fill: parent

                ListView {
                    anchors.fill: parent

                    delegate: Row {
                        spacing: 10
                        Label {
                            text: display.bonus
                            width: 45
                            font.pointSize: 18
                            horizontalAlignment: Text.AlignRight
                        }
                        Label {
                            text: display.name
                            verticalAlignment: Text.AlignVCenter
                            height: Math.max(parent.height, paintedHeight)
                            font.pointSize: 10
                        }
                    }

                    model: intelligence
                }
            }
        }
    }
}
