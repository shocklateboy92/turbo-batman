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
    createPhantom();
}

int Attribute::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.length() + 1; // including the phatom
}

QVariant Attribute::data(const QModelIndex &index, int role) const
{
    QVariant var;

    if (index.isValid()) {
        switch (role) {
        case Qt::DisplayRole:
            if (index.row() < m_data.length()) {
                var = QVariant::fromValue(m_data[index.row()]);
            } else {
                var = QVariant::fromValue(m_phantom);
            }
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

    emit modifiersChanged(m_modifiers);
    emit valueChanged(value());
}

void Attribute::clearData()
{
    beginResetModel();
    m_data.clear();
    endResetModel();
}


bool Attribute::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(parent, row, row + count -1);

    ModifierType *mod = new ModifierType();
    connect(mod, &Modifier::bonusChanged,
            this, &Attribute::valueChanged);
    m_data.insert(row, mod);

    emit modifiersChanged(modifiers());
    endInsertRows();

    return true;
}

void Attribute::createPhantom()
{
    m_phantom = new Modifier();
    m_phantom->setParent(this); // in case we get deleted before it's used
    m_phantom->setPersistent(false);
    m_phantom->setPhantom(true);

    connect(m_phantom, &Modifier::bonusChanged,
            this, &Attribute::promotePhantom);
    connect(m_phantom, &Modifier::nameChanged,
            this, &Attribute::promotePhantom);
}

void Attribute::promotePhantom()
{
    ModifierType* phantom = qobject_cast<ModifierType*>(QObject::sender());

    Q_ASSERT(phantom->phantom());
    Q_ASSERT(phantom == m_phantom);

    phantom->setParent(nullptr);
    phantom->setPhantom(false);

    disconnect(phantom, &Modifier::bonusChanged,
               this, &Attribute::promotePhantom);
    disconnect(phantom, &Modifier::nameChanged,
               this, &Attribute::promotePhantom);

    int count = rowCount(QModelIndex());
    beginInsertRows(QModelIndex(), count, count);
    addModifier(phantom);
    createPhantom();
    endInsertRows();
}
