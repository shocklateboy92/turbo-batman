#include "FilterProxyModel.h"

#include <QDebug>

FilterProxyModel::FilterProxyModel(QObject *parent) :
    QSortFilterProxyModel(parent), m_source(nullptr),
    m_searchString(QString::null), m_wizardLevel(-1)
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

int FilterProxyModel::wizardLevel() const
{
    return m_wizardLevel;
}

void FilterProxyModel::setSource(QObject *arg)
{
    if (m_source != arg) {
        m_source = qobject_cast<QAbstractItemModel*>(arg);
        emit sourceChanged(arg);

        setSourceModel(m_source);
        if (m_source) {
            auto role = m_source->roleNames().key("wiz");
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

void FilterProxyModel::setWizardLevel(int arg)
{
    if (m_wizardLevel != arg) {
        m_wizardLevel = arg;
        emit wizardLevelChanged(arg);

        setFilterFixedString(QString::number(arg));
    }
}
