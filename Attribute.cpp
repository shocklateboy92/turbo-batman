#include "Attribute.h"
#include <algorithm>
#include <numeric>
#include <QDebug>

Attribute::Attribute(QObject *parent) :
    QAbstractListModel(parent), m_modifiers(this, m_data)
{
}


int Attribute::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.length();
}

QVariant Attribute::data(const QModelIndex &index, int role) const
{
    QVariant var;

    if (index.isValid()) {
        switch (role) {
        case Qt::DisplayRole:
            var = QVariant::fromValue(m_data[index.row()]);
            break;
        default:
            break;
        }
    }

    return var;
}

QVariant Attribute::value() const
{
    if (m_data.isEmpty()) {
        return "";
    }

    return std::accumulate(
                m_data.begin(),
                m_data.end(),
                0,
                [](int a, ModifierType *b) {return a + b->bonus();});
}

Attribute::ModifierList Attribute::modifiers() const
{
    return m_modifiers;
}

void Attribute::setModifiers(ModifierList arg)
{
    if (!(m_modifiers == arg)) {
        m_modifiers = arg;
        emit modifiersChanged(arg);
    }
}
