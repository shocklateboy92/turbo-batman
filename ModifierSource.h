#ifndef MODIFIERSOURCE_H
#define MODIFIERSOURCE_H

#include <QObject>

class ModifierSource : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool active READ active WRITE setActive NOTIFY activeChanged)

private:
    bool m_active;

public:
    explicit ModifierSource(QObject *parent = 0);

    bool active() const;

signals:
    void activeChanged(bool arg);

public slots:
    void setActive(bool arg);
};

#endif // MODIFIERSOURCE_H
