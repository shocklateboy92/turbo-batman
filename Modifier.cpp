#include "Modifier.h"
#include <QDebug>

Modifier::Modifier(QObject *parent) :
    QObject(parent), m_bonus(0), m_persistent(true),
    m_phantom(false), m_source(nullptr)
{
}

QString Modifier::name() const
{
    return m_name;
}

int Modifier::bonus() const
{
    if (m_source && !m_source->active()) {
        return 0;
    }

    return m_bonus;
}

ModifierSource *Modifier::source() const
{
    return m_source;
}

bool Modifier::persistent() const
{
    return m_persistent;
}

bool Modifier::phantom() const
{
    return m_phantom;
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

void Modifier::setSource(ModifierSource *arg)
{
    if (m_source != arg) {
        if (m_source) { // clean up after ourselves
            disconnect(m_source, &ModifierSource::activeChanged,
                       this, &Modifier::bonusChanged);
        }
        m_source = arg;

        emit sourceChanged(arg);
        if (!m_source->active()) {
            emit bonusChanged(bonus());
        }

        connect(m_source, &ModifierSource::activeChanged,
                this, &Modifier::bonusChanged);
    }
}

void Modifier::setPersistent(bool arg)
{
    if (m_persistent != arg) {
        m_persistent = arg;
        emit persistentChanged(arg);
    }
}

void Modifier::setPhantom(bool arg)
{
    if (m_phantom != arg) {
        m_phantom = arg;
        emit phantomChanged(arg);
    }
}
