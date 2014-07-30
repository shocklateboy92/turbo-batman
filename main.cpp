#include "Attribute.h"
#include "Modifier.h"
#include "ModifierSource.h"
#include "Sizes.h"
#include "Spell.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QSqlDatabase>
#include <QSqlDriver>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Attribute>("org.lasath.turbo_batman", 1, 0, "Attribute");
    qmlRegisterType<Modifier>("org.lasath.turbo_batman", 1, 0, "Modifier");
    qmlRegisterType<ModifierSource>("org.lasath.turbo_batman", 1, 0, "ModifierSource");
    qmlRegisterType<Spell>("org.lasath.turbo_batman", 1, 0, "Spell");

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("spells.db");
    Q_ASSERT(db.open());

    QQmlApplicationEngine engine;
    Sizes sizes;
    engine.rootContext()->setContextProperty("sizes", &sizes);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
