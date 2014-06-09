#include "Sizes.h"

#include <QApplication>

Sizes::Sizes(QObject *parent) :
    QObject(parent), m_metrics(QApplication::font())
{
}

int Sizes::pixelHeight(int points)
{
    QFont font = QApplication::font();
    font.setPointSize(points);
    QFontMetrics metrics = QFontMetrics(font);
    return metrics.boundingRect("M").size().height();
}

int Sizes::pixelWidth(int points)
{
    QFont font = QApplication::font();
    font.setPointSize(points);
    QFontMetrics metrics = QFontMetrics(font);
    return metrics.boundingRect("M").size().width();
}

int Sizes::pxH(int points)
{
    return pixelHeight(points);
}

int Sizes::pxW(int points)
{
    return pixelWidth(points);
}

int Sizes::mHeight(qreal pt)
{
    return m_metrics.boundingRect("M").size().height() * pt;
}

int Sizes::mWidth(qreal pt)
{
    return m_metrics.boundingRect("M").size().width() * pt;
}
