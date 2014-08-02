#ifndef SPELLSMODEL_H
#define SPELLSMODEL_H

#include <QAbstractListModel>
#include <QSqlQuery>
#include <QHash>

class SpellsModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit SpellsModel(QObject *parent = 0);

signals:

public slots:


    // QAbstractItemModel interface
public:
    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

private:
    mutable QSqlQuery m_query;

    std::size_t m_size;
    int m_cols;

    QHash<int, QByteArray> m_roles;
};

#endif // SPELLSMODEL_H
