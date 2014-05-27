#include "Attribute.h"
#include "Modifier.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Attribute>("org.lasath.turbo_batman", 1, 0, "Attribute");
    qmlRegisterType<Modifier>("org.lasath.turbo_batman", 1, 0, "Modifier");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
