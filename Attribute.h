#ifndef ATTRIBUTE_H
#define ATTRIBUTE_H

#include "Modifier.h"

#include <QAbstractListModel>
#include <QQmlComponent>
#include <QQmlListProperty>

class Attribute : public QAbstractListModel
{
    typedef Modifier ModifierType;
    typedef QQmlListProperty<ModifierType> ModifierList;
    typedef QList<ModifierType*> ModifierDataList;

    Q_OBJECT
    Q_PROPERTY(QVariant value READ value NOTIFY valueChanged)
    Q_PROPERTY(QQmlListProperty<Modifier> modifiers READ modifiers WRITE setModifiers NOTIFY modifiersChanged)
    Q_CLASSINFO("DefaultProperty", "modifiers")

public:
    explicit Attribute(QObject *parent = 0);

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;

    QVariant value() const;
    ModifierList modifiers() const;

signals:
    void valueChanged(QVariant arg);
    void modifiersChanged(ModifierList arg);

private:
    ModifierList m_modifiers;
    ModifierDataList m_data;

public slots:
    void setModifiers(ModifierList arg);
};

#endif // ATTRIBUTE_H
