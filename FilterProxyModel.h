#ifndef FILTERPROXYMODEL_H
#define FILTERPROXYMODEL_H

#include <QSortFilterProxyModel>

class FilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(QObject* source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QString searchString READ searchString WRITE setSearchString
               NOTIFY searchStringChanged)
    Q_PROPERTY(int wizardLevel READ wizardLevel WRITE setWizardLevel NOTIFY wizardLevelChanged)
public:
    explicit FilterProxyModel(QObject *parent = 0);

    QObject* source() const;
    QString searchString() const;
    int wizardLevel() const;

signals:
    void sourceChanged(QObject* arg);
    void searchStringChanged(QString arg);
    void wizardLevelChanged(int arg);

public slots:
    void setSource(QObject* arg);
    void setSearchString(QString arg);
    void setWizardLevel(int arg);

private:
    QAbstractItemModel* m_source;
    QString m_searchString;
    int m_wizardLevel;
};

#endif // FILTERPROXYMODEL_H
