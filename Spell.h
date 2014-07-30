#ifndef SPELL_H
#define SPELL_H

#include "Modifier.h"

#include <QSqlQuery>
#include <QUrl>

class Spell : public Modifier
{
    Q_OBJECT
    Q_PROPERTY(QUrl link READ link NOTIFY linkChanged)
    Q_PROPERTY(QString description READ description NOTIFY descriptionChanged)
    Q_PROPERTY(int spellId READ spellId WRITE setSpellId NOTIFY spellIdChanged)

public:
    explicit Spell(QObject *parent = 0);

    QString description() const;
    QUrl 	link() const;
    int 	spellId() const;

public slots:
    void setSpellId(int arg);

signals:
    void descriptionChanged(QString arg);
    void linkChanged(QUrl arg);
    void spellIdChanged(int arg);

private:
    QUrl m_link;
    QString m_description;
    int m_spellId;

    QSqlQuery m_query;
};

#endif // SPELL_H
