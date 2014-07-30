#include "Spell.h"

#include <QSqlDatabase>
#include <QSqlError>
#include <QDebug>

Spell::Spell(QObject *parent) :
    Modifier(parent)
{
    m_query.prepare(
          "SELECT "
            "name, "
            "description_formated, "
            "linktext "
          "FROM spells "
          "WHERE id = :id");
    setBonus(1);
}

QString Spell::description() const
{
    return m_description;
}

QUrl Spell::link() const
{
    return m_link;
}

int Spell::spellId() const
{
    return m_spellId;
}

void Spell::setSpellId(int arg)
{
    if (m_spellId != arg) {
        m_spellId = arg;

        emit spellIdChanged(arg);

        m_query.bindValue(":id", spellId());
        if (!m_query.exec()) {
            qDebug() << m_query.lastError();
        }

        m_query.next();
        setName(m_query.value(0).toString());
        m_description = m_query.value(1).toString();
        emit descriptionChanged(description());
        m_link = m_query.value(2).toUrl();
        emit linkChanged(link());
    }
}
