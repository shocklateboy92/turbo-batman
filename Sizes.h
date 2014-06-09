#ifndef SIZES_H
#define SIZES_H

#include <QObject>

class Sizes : public QObject
{
    Q_OBJECT
public:
    explicit Sizes(QObject *parent = 0);

    Q_INVOKABLE
    int pixelHeight(int points);

    Q_INVOKABLE
    int pixelWidth(int points);

    Q_INVOKABLE
    int pxH(int points);

    Q_INVOKABLE
    int pxW(int points);
};

#endif // SIZES_H
