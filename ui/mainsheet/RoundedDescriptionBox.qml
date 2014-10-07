import QtQuick 2.0

DescriptionBox {
    Repeater {
        model: [[parent.left, parent.top],
            [parent.left, parent.bottom],
            [parent.right, parent.top],
            [parent.right, parent.bottom]]
        delegate: Rectangle {
            height: parent.height
            width: parent.height
            anchors {
                horizontalCenter: modelData[0]
                verticalCenter: modelData[1]
            }
            radius: parent.height
            transform: Scale {
                xScale: 2
                origin: Qt.vector3d(width/2, height/2, 0)
            }
        }
    }
    clip: true
}
