#ifndef PREPAREDSPELLSMODEL_H
#define PREPAREDSPELLSMODEL_H

#include <QAbstractListModel>
#include <QList>

class PreparedSpellsModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QList<int> levelSlots READ levelSlots
               WRITE setLevelSlots NOTIFY levelSlotsChanged)
    Q_PROPERTY(QObject* source READ source
               WRITE setSource NOTIFY sourceChanged)
public:
    explicit PreparedSpellsModel(QObject *parent = 0);

signals:
    void levelSlotsChanged(QList<int> arg);
    void sourceChanged(QObject* arg);

public:
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    QList<int> levelSlots() const;
    QObject* source() const;

public slots:
    void setLevelSlots(QList<int> arg);
    void setSource(QObject* arg);

private:
    QList<QVariantList> m_data;
    QList<int> m_levelSlots;
    QObject* m_source;

    void initialize();
};

#endif // PREPAREDSPELLSMODEL_H
