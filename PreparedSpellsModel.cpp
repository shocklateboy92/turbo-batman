#include "PreparedSpellsModel.h"

PreparedSpellsModel::PreparedSpellsModel(QObject *parent) :
    QAbstractListModel(parent), m_data(),
    m_levelSlots(), m_source(nullptr)
{
}

void PreparedSpellsModel::setLevelSlots(QList<int> arg)
{
    if (m_levelSlots == arg)
        return;

    m_levelSlots = arg;
    emit levelSlotsChanged(arg);
    initialize();
}

void PreparedSpellsModel::setSource(QObject *arg)
{
    if (m_source == arg)
        return;

    m_source = arg;
    emit sourceChanged(arg);
    initialize();
}

void PreparedSpellsModel::initialize()
{
    if (m_levelSlots.isEmpty() || m_source == nullptr) {
        return;
    }

    for (int i = 0; i != m_levelSlots.length(); i++) {
        for (int j = 0; j < m_levelSlots[i]; j++) {
            m_data.append({i, ""});
        }
    }
}


int PreparedSpellsModel::rowCount(const QModelIndex &parent) const
{
    return m_data.length();
}

QVariant PreparedSpellsModel::data(const QModelIndex &index, int role) const
{
    if (index.isValid()) {
        QVariantList row = m_data.at(index.row());
        auto col = role - Qt::UserRole;
        if (0 <= col && col < row.length()) {
            return row.at(col);
        }
    }

    return QVariant();
}

QHash<int, QByteArray> PreparedSpellsModel::roleNames() const
{
    return {
        {Qt::UserRole, "level"},
        {Qt::UserRole + 1, "name"}
    };
}

QList<int> PreparedSpellsModel::levelSlots() const
{
    return m_levelSlots;
}

QObject *PreparedSpellsModel::source() const
{
    return m_source;
}
