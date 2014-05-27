#ifndef ATTRIBUTE_H
#define ATTRIBUTE_H

#include <QAbstractListModel>

class Attribute : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit Attribute(QObject *parent = 0);

signals:

public slots:

};

#endif // ATTRIBUTE_H
