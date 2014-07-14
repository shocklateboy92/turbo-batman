#include "ModifierSource.h"

ModifierSource::ModifierSource(QObject *parent) :
    QObject(parent)
{
}

bool ModifierSource::active() const
{
    return m_active;
}

void ModifierSource::setActive(bool arg)
{
    if (m_active != arg) {
        m_active = arg;
        emit activeChanged(arg);
    }
}
