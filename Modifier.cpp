#include "Modifier.h"

Modifier::Modifier(QObject *parent) :
    QObject(parent)
{
}

QString Modifier::name() const
{
    return m_name;
}

int Modifier::bonus() const
{
    return m_bonus;
}

void Modifier::setName(QString arg)
{
    if (m_name != arg) {
        m_name = arg;
        emit nameChanged(arg);
    }
}

void Modifier::setBonus(int arg)
{
    if (m_bonus != arg) {
        m_bonus = arg;
        emit bonusChanged(arg);
    }
}
