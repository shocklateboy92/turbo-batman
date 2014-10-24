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
    Q_INVOKABLE void save();
    Q_INVOKABLE void load();
public:
    virtual QHash<int, QByteArray> roleNames() const;
    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual bool setData(const QModelIndex &index,
                         const QVariant &value, int role);

private:
    std::size_t m_size;
    int m_cols;
    QVariantMap m_extraRoles;
    QHash<int, QByteArray> m_roles;
    QList<QList<QVariant>> m_data;
};

#endif // SPELLSMODEL_H
