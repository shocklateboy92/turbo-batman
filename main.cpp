#include "Attribute.h"
#include "Modifier.h"
#include "ModifierSource.h"
#include "Sizes.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Attribute>("org.lasath.turbo_batman", 1, 0, "Attribute");
    qmlRegisterType<Modifier>("org.lasath.turbo_batman", 1, 0, "Modifier");
    qmlRegisterType<ModifierSource>("org.lasath.turbo_batman", 1, 0, "ModifierSource");

    QQmlApplicationEngine engine;
    Sizes sizes;
    engine.rootContext()->setContextProperty("sizes", &sizes);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
