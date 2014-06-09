#include "Sizes.h"

#include <QFontMetrics>
#include <QApplication>

Sizes::Sizes(QObject *parent) :
    QObject(parent)
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
