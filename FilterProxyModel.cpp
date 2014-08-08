#include "FilterProxyModel.h"

#include <QDebug>

FilterProxyModel::FilterProxyModel(QObject *parent) :
    QSortFilterProxyModel(parent)
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

void FilterProxyModel::setSource(QObject *arg)
{
    if (m_source != arg) {
        m_source = qobject_cast<QAbstractItemModel*>(arg);
        emit sourceChanged(arg);

        setSourceModel(m_source);
        if (m_source) {
            auto role = m_source->roleNames().key("name");
            setFilterRole(role);
        }
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
