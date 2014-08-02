#include "SpellsModel.h"

#include <QDebug>
#include <QSqlError>
#include <QSqlRecord>
#include <QSqlField>

SpellsModel::SpellsModel(QObject *parent) :
    QAbstractListModel(parent)
{
    m_query.prepare("SELECT * FROM spells");
    if (!m_query.exec()) {
        qDebug() << m_query.lastError();
    }

    m_query.last();
    m_size = m_query.at() + 1;
    m_query.first();
    qDebug() << m_size;

    // role names will be column names
    m_cols = m_query.record().count();
    for (int i = 0; i < m_cols; i++) {
        m_roles.insert(i + Qt::UserRole,
                       m_query.record().field(i).name().toUtf8());
    }
}


int SpellsModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_size;
}

QVariant SpellsModel::data(const QModelIndex &index, int role) const
{
    if (index.isValid()) {
        auto col = role - Qt::UserRole;
        if (0 <= col && col < m_cols) {
            m_query.seek(index.row());
            return m_query.value(col);
        }
    }

    return QVariant();
}

QHash<int, QByteArray> SpellsModel::roleNames() const
{
    return m_roles;
}
