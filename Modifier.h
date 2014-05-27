#ifndef MODIFIER_H
#define MODIFIER_H

#include <QObject>

class Modifier : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int bonus READ bonus WRITE setBonus NOTIFY bonusChanged)

private:
    QString m_name;
    int m_bonus;

public:
    explicit Modifier(QObject *parent = 0);

    QString name() const;
    int bonus() const;

signals:
    void nameChanged(QString arg);
    void bonusChanged(int arg);

public slots:
    void setName(QString arg);
    void setBonus(int arg);
};

#endif // MODIFIER_H
