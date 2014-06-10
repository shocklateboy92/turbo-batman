import QtQuick 2.0
import QtQuick.Window 2.1

Row {
    spacing: sizes.mWidth(0.5)

    Item {
        height: c1.height
        width: c1.width + sizes.mWidth(1)
        Column {
            id: c1
            Repeater {
                model: skill_list.skills
                delegate: Text {
                    text: modelData.name.toUpperCase()
                }
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills
            delegate: Text {
                height: sizes.mHeight(1)
                width: sizes.mWidth(4)

                text: modelData.mod.value
                color: "gray"
                horizontalAlignment: Text.AlignHCenter

                Rectangle {
                    color: "black"
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    height: 1
                }
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills.length
            delegate: Text {
                text: "="
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills
            delegate: Text {
                text: modelData.mod.title.toUpperCase()
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills
            delegate: Text {
                height: sizes.mHeight(1)
                width: sizes.mWidth(4)

                text: modelData.mod.value
                color: "gray"
                horizontalAlignment: Text.AlignHCenter

                Rectangle {
                    color: "black"
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    height: 1
                }
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills.length
            delegate: Text {
                text: "+"
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills
            delegate: Text {
                height: sizes.mHeight(1)
                width: sizes.mWidth(4)

                text: modelData.mod.value
                color: "gray"
                horizontalAlignment: Text.AlignHCenter

                Rectangle {
                    color: "black"
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    height: 1
                }
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills.length
            delegate: Text {
                text: "+"
            }
        }
    }

    Column {
        Repeater {
            model: skill_list.skills
            delegate: Text {
                height: sizes.mHeight(1)
                width: sizes.mWidth(4)

                text: modelData.mod.value
                color: "gray"
                horizontalAlignment: Text.AlignHCenter

                Rectangle {
                    color: "black"
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }
                    height: 1
                }
            }
        }
    }

    Component.onCompleted: {
        console.log(sizes.pixelWidth(8));
        console.log(sizes.pixelHeight(8));
        console.log(sizes.mHeight(1.5));
        console.log(sizes.mWidth(1));
    }
}
