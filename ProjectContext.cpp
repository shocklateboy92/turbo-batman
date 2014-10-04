#include "ProjectContext.h"

ProjectContext::ProjectContext(QObject *parent) :
    QObject(parent), m_spells_db(new SpellsModel(this))
{
}

QVariant ProjectContext::spells_db() const
{
    return QVariant::fromValue(m_spells_db);
}

void ProjectContext::writeSpells(const QString &str){
    QFile file ("prepped_spells.json");
    file.open (QIODevice::WriteOnly | QIODevice::Text);
    Q_ASSERT (file.isOpen());
    QTextStream os(&file);
    os << str;
    file.close();

}

QString ProjectContext::readSpells()
{
 QFile file ("prepped_spells.json");
 file.open (QIODevice::ReadOnly | QIODevice::Text);
 Q_ASSERT (file.isOpen());
 return QString(file.readAll());
}
