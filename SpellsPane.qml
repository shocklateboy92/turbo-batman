import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import org.lasath.turbo_batman 1.0

Item {
    width: 800
    height: 800

    SystemPalette {
        id: palette
    }

    RowLayout {
        id: filter_box
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: anchors.leftMargin
        }
        height: sizes.mHeight(4)

        Label {
            text: "Filter: "
        }

        TextField {
            id: filter_field
            Layout.fillWidth: true
            height: parent.height

            focus: true
        }
    }

    GroupBox {
        title: "All Spells"
        id: groupbox
        anchors {
            top: filter_box.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 10
            rightMargin: anchors.leftMargin
        }

        ScrollView {
            anchors.fill: parent
            style: ScrollViewStyle { }
            Flow {
                width: groupbox.width
                Repeater {
                    id: view
                    clip: true
                    model: FilterProxyModel {
                        source: turbo_batman.spells_db
                        wizardLevel: 1
                    }

                    delegate: SpellDelegate {
                        id: del
                    }

                    onCountChanged: {
                        console.log(count);
                    }
                }
            }
        }
    }
}
