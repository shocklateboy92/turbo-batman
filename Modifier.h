#ifndef MODIFIER_H
#define MODIFIER_H

#include "ModifierSource.h"

#include <QObject>

class Modifier : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int bonus READ bonus WRITE setBonus NOTIFY bonusChanged)
    Q_PROPERTY(ModifierSource* source READ source WRITE setSource NOTIFY sourceChanged)

private:
    QString m_name;
    int m_bonus;
    ModifierSource* m_source;

public:
    explicit Modifier(QObject *parent = 0);

    QString name() const;
    int bonus() const;
    ModifierSource* source() const;

signals:
    void nameChanged(QString arg);
    void bonusChanged(int arg);
    void sourceChanged(ModifierSource* arg);

public slots:
    void setName(QString arg);
    void setBonus(int arg);
    void setSource(ModifierSource* arg);
};

#endif // MODIFIER_H
