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
    Q_PROPERTY(QQmlListProperty<Modifier> modifiers
               READ modifiers NOTIFY modifiersChanged)
    Q_CLASSINFO("DefaultProperty", "modifiers")

public:
    explicit Attribute(QObject *parent = 0);

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;

    QVariant value() const;
    ModifierList modifiers() const;
    ModifierType* modifierAt(int index) const;

signals:
    void valueChanged(QVariant arg);
    void modifiersChanged(ModifierList modifiers);

private:
    ModifierList m_modifiers;
    ModifierDataList m_data;

public slots:
    void addModifier(Modifier *mod);
    void clearData();

    bool insertRows(int row, int count,
                    const QModelIndex &parent = QModelIndex()) override;
};

#endif // ATTRIBUTE_H
