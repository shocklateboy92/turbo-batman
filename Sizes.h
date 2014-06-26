#ifndef SIZES_H
#define SIZES_H

#include <QObject>
#include <QFontMetrics>
#include <QFont>

class Sizes : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QFont smallFont READ smallFont NOTIFY smallFontChanged)
    Q_PROPERTY(QFont tinyFont READ tinyFont NOTIFY tinyFontChanged)

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

    QFont smallFont() const;
    QFont tinyFont() const;

signals:
    void smallFontChanged(QFont arg);
    void tinyFontChanged(QFont arg);

private:
    QFontMetrics m_metrics;
    QFont m_smallFont;
    QFont m_tinyFont;
};

#endif // SIZES_H
