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
    Q_PROPERTY(bool persistent READ persistent WRITE setPersistent NOTIFY persistentChanged)
    Q_PROPERTY(bool phantom READ phantom WRITE setPhantom NOTIFY phantomChanged)

private:
    int 			m_bonus;
    QString 		m_name;
    bool 			m_persistent;
    bool            m_phantom;
    ModifierSource* m_source;


public:
    explicit Modifier(QObject *parent = 0);

    int 			bonus() const;
    QString 		name() const;
    bool 			persistent() const;
    bool 			phantom() const;
    ModifierSource* source() const;

signals:
    void bonusChanged(int arg);
    void nameChanged(QString arg);
    void persistentChanged(bool arg);
    void phantomChanged(bool arg);
    void sourceChanged(ModifierSource* arg);

public slots:
    void setBonus(int arg);
    void setName(QString arg);
    void setPersistent(bool arg);
    void setPhantom(bool arg);
    void setSource(ModifierSource* arg);
};

#endif // MODIFIER_H
