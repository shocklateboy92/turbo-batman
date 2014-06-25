import QtQuick 2.0
import org.lasath.turbo_batman 1.0

Item {
    id: root
    property list<Attribute> __skill_list
    default property alias skills: root.__skill_list
    property alias data: root.__skill_list
}
