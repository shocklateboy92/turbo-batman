#include "ProjectContext.h"

ProjectContext::ProjectContext(QObject *parent) :
    QObject(parent), m_spells_db(new SpellsModel(this))
{
}

QVariant ProjectContext::spells_db() const
{
    return QVariant::fromValue(m_spells_db);
}
