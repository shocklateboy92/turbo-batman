#include "SpellsModel.h"
#include <QDebug>
#include <QSqlError>
#include <QSqlRecord>
#include <QSqlField>

SpellsModel::SpellsModel(QObject *parent) :
    QAbstractListModel(parent)
{
    QSqlQuery m_query;
    m_query.prepare("SELECT * FROM spells");
    if (!m_query.exec()) {
        qDebug() << m_query.lastError();
    }

    m_query.last();
    m_size = m_query.at();
    m_query.first();
    qDebug() << m_size;

    // role names will be column names
    m_cols = m_query.record().count();
    for (int i = 0; i < m_cols; i++) {
        m_roles.insert(i + Qt::UserRole,
                       m_query.record().field(i).name().toUtf8());
    }

    // we're going to ghetto up two extra properties per spell
    m_roles.insert(Qt::UserRole + m_cols, "num_prepped");
    m_cols++;
    m_roles.insert(Qt::UserRole + m_cols, "num_cast");
    m_cols++;

    // stick all the data in a giant list, for direct access
    while (m_query.next()) {
        QList<QVariant> l;
        l.reserve(m_cols);

        for (int i = 0; i < m_cols - 2; i++) {
            l.append(m_query.value(i));
        }

        // spell prep/cast counts
        l.append(0);
        l.append(0);
        m_data.append(l);
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
            return m_data.at(index.row()).at(col);
        }
    }

    return QVariant();
}

bool SpellsModel::setData(const QModelIndex &index,
                          const QVariant &value, int role)
{
    if (index.isValid()) {
        auto col = role - Qt::UserRole;
        if (0 <= col && col < m_cols) {
            m_data[index.row()][col] = value;
            return true;
        }
    }

    return false;
}

QHash<int, QByteArray> SpellsModel::roleNames() const
{
    return m_roles;
}
