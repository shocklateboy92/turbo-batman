import QtQuick 2.0

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1

import org.lasath.turbo_batman 1.0

ApplicationWindow {
    id: batman
    property alias currentAttribute: modifiers_list.model

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
        orientation: Qt.Horizontal
        anchors.fill: parent

        Item {
            Rectangle {
                color: "white"
                radius: 3
                anchors.fill: parent
                anchors.margins: 10
            }

            Layout.fillWidth: true
            ScrollView {
                anchors.fill: parent
                anchors.margins: 20
                contentItem: Item {
                    MainSheet {
                        id: ci
                        transform: Scale {
                            id: cis
                            xScale: 1
                            yScale: xScale
                        }
                    }
                    width: ci.width * cis.xScale
                    height: ci.height * cis.yScale
                }
            }
        }

        SplitView {
            orientation: Qt.Vertical
            width: parent.width * 0.4

            Item {
                height: parent.height * 0.4
                GroupBox {
                    anchors.fill: parent
                    anchors.margins: 10
                    title: "Conditions"

                    ListView {
                        delegate: CheckBox {
                            text: modelData.name

                            onClicked: {
                                modelData.active = !modelData.active;
                            }
                        }

                        anchors.fill: parent
                        anchors.margins: 5
                        model: conds.conditions
                    }
                }
            }

            Item {
                width: parent.width

                GroupBox {
                    title: "Modifiers"
                    anchors.margins: 10
                    anchors.fill: parent

                    Flickable {
                        anchors.fill: parent
                        contentWidth: width
                        contentHeight: modifiers_list.height
                        clip: true

                        ModifiersListView {
                            id: modifiers_list
                        }
                    }
                }
            }
        }
    }
}
