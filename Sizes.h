#ifndef SIZES_H
#define SIZES_H

#include <QObject>
#include <QFontMetrics>

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

    Q_INVOKABLE
    int mHeight(qreal pt);

    Q_INVOKABLE
    int mWidth(qreal pt);

private:
    QFontMetrics m_metrics;
};

#endif // SIZES_H
