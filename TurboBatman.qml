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
                ScrollView {
                    anchors.fill: parent
                    anchors.margins: 20
                    contentItem: Item {
                        SkillsArea {
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

            Item {
                width: parent.width * 0.4
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
        }

        Item {
            height: 400
            GroupBox {
                title: "Modifiers"
                anchors.margins: 10
                anchors.fill: parent

                ListView {
                    anchors.fill: parent
                    id: modifiers_list

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
                }
            }
        }
    }
}
