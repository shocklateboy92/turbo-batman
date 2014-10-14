#include "FilterProxyModel.h"

#include <QDebug>

FilterProxyModel::FilterProxyModel(QObject *parent) :
    QSortFilterProxyModel(parent), m_source(nullptr),
    m_searchString(QString::null), m_matchString(-1),
    m_filterRole(QString::null)
{
    setFilterCaseSensitivity(Qt::CaseInsensitive);
}


QObject *FilterProxyModel::source() const
{
    return m_source;
}

QString FilterProxyModel::searchString() const
{
    return m_searchString;
}

QString FilterProxyModel::matchString() const
{
    return m_matchString;
}

QString FilterProxyModel::filterRole() const
{
    return m_filterRole;
}

void FilterProxyModel::setSource(QObject *arg)
{
    if (m_source != arg) {
        m_source = qobject_cast<QAbstractItemModel*>(arg);
        emit sourceChanged(arg);
        intitialize();
    }
}

void FilterProxyModel::setSearchString(QString arg)
{
    arg = arg.simplified().replace(' ', '*');

    if (m_searchString != arg) {
        m_searchString = arg;
        emit searchStringChanged(arg);
        qDebug() << arg;
        setFilterWildcard(arg);
    }
}

void FilterProxyModel::setMatchString(QString arg)
{
    if (m_matchString != arg) {
        m_matchString = arg;
        emit matchStringlChanged(arg);
        QSortFilterProxyModel::setFilterFixedString(arg);

    }
}

void FilterProxyModel::setFilterRole(QString arg)
{
    if (m_filterRole != arg) {
        m_filterRole = arg;
        emit matchStringlChanged(arg);
        intitialize();
    }
}

void FilterProxyModel::intitialize() {
    if (m_source && !m_filterRole.isEmpty()){
        QSortFilterProxyModel::setSourceModel(m_source);
        int role = m_source->roleNames().key(m_filterRole.toLatin1());
        QSortFilterProxyModel::setFilterRole(role);
    }
}
