#ifndef PROJECTCONTEXT_H
#define PROJECTCONTEXT_H

#include "SpellsModel.h"

#include <QObject>

class ProjectContext : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant spells_db READ spells_db NOTIFY spells_dbChanged)

public:
    explicit ProjectContext(QObject *parent = 0);

    QVariant spells_db() const;

signals:
    void spells_dbChanged(QVariant arg);

private:
    SpellsModel *m_spells_db;
};

#endif // PROJECTCONTEXT_H
