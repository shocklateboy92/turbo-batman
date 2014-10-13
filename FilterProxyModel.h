#ifndef FILTERPROXYMODEL_H
#define FILTERPROXYMODEL_H

#include <QSortFilterProxyModel>

class FilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(QObject* source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QString searchString READ searchString WRITE setSearchString
               NOTIFY searchStringChanged)
    Q_PROPERTY(QString matchString READ matchString WRITE setMatchString NOTIFY matchStringlChanged)
    Q_PROPERTY(QString filterRole READ filterRole WRITE setFilterRole NOTIFY filterRoleChanged)

public:
    explicit FilterProxyModel(QObject *parent = 0);
    QObject* source() const;
    QString searchString() const;
    QString matchString() const;
    QString filterRole() const;

signals:
    void sourceChanged(QObject* arg);
    void searchStringChanged(QString arg);
    void matchStringlChanged(QString arg);
    void filterRoleChanged(QString arg);

public slots:
    void setSource(QObject* arg);
    void setSearchString(QString arg);
    void setMatchString(QString arg);
    void setFilterRole(QString arg);

private:
    QAbstractItemModel* m_source;
    QString m_searchString;
    QString m_filterRole;
    QString m_matchString;

private:
    void intitialize();
};

#endif // FILTERPROXYMODEL_H
