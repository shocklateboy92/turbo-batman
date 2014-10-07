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

    Item {
        id: saveLoadBox
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: anchors.leftMargin
        }
        height: sizes.mHeight(4)
        Button {
            id: save
            text: "Save"
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                var spellsState = {};
                spellsState.knownlist = [];
                spellsState.preplist = [];
                for ( var i = 0; i <view.count; i++){
                    spellsState.knownlist[i] = view.itemAt(i).knownChecked
                    spellsState.preplist[i] = view.itemAt(i).prepChecked
                }
                console.debug(JSON.stringify(spellsState))
                turbo_batman.writeSpells(JSON.stringify(spellsState));
            }

        }
        Button {
            id: load
            text: "Load"
            anchors.left: save.right
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                var spellsState = JSON.parse(turbo_batman.readSpells());

                for ( var i = 0; i <view.count; i++){
                    view.itemAt(i).knownChecked = spellsState.knownlist[i]
                    view.itemAt(i).prepChecked = spellsState.preplist[i]
                }
            }
        }

    }

    GroupBox {
        title: "1st Level Spells"
        id: groupbox
        anchors {
            top: saveLoadBox.bottom
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
                        wizardLevel: modelData
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
