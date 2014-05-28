#include "Attribute.h"
#include <algorithm>
#include <numeric>
#include <QDebug>

static void append(QQmlListProperty<Modifier> *property, Modifier *value) {
    Attribute *attr = qobject_cast<Attribute*>(property->object);
    attr->addModifier(value);
}

static Modifier* at(QQmlListProperty<Modifier> *property, int index) {
    Attribute *attr = qobject_cast<Attribute*>(property->object);
    return attr->modifierAt(index);
}

static void clear(QQmlListProperty<Modifier> *property) {
    Attribute *attr = qobject_cast<Attribute*>(property->object);
    attr->clearData();
}

static int count(QQmlListProperty<Modifier> *property) {
    Attribute *attr = qobject_cast<Attribute*>(property->object);
    return attr->rowCount(QModelIndex());
}

Attribute::Attribute(QObject *parent) :
    QAbstractListModel(parent), m_modifiers(this, this, &append, &count, &at, &clear)
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

Attribute::ModifierType* Attribute::modifierAt(int index) const
{
    return m_data.at(index);
}

void Attribute::addModifier(Modifier *mod)
{
    connect(mod, &Modifier::bonusChanged, this, &Attribute::valueChanged);
    m_data.append(mod);
}

void Attribute::clearData()
{
    beginResetModel();
    m_data.clear();
}
