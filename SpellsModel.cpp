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
                       m_query.record().field(i).name().toLatin1());
    }

    // A set of extra roles, and the default values they should have
    QVariantMap extra_roles = {
        {"num_prepped", 0},
        {"num_cast", 0},
        {"spell_known", false},
        {"spell_prepped", false}
    };

    for (auto r : extra_roles.keys()) {
        m_roles.insert(Qt::UserRole + m_cols, r.toLatin1());
        m_cols++;
    }

    // stick all the data in a giant list, for direct access
    while (m_query.next()) {
        QList<QVariant> l;
        l.reserve(m_cols);

        for (int i = 0; i < m_cols - extra_roles.size(); i++) {
            l.append(m_query.value(i));
        }

        // stick our extra roles as well
        for (auto r : extra_roles) {
            l.append(r);
        }

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
    qDebug() << "writing " << value << "to" << index;
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
