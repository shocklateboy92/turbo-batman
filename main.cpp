#include "Attribute.h"
#include "Completer.h"
#include "FilterProxyModel.h"
#include "Modifier.h"
#include "ModifierSource.h"
#include "PreparedSpellsModel.h"
#include "ProjectContext.h"
#include "Sizes.h"
#include "Spell.h"
#include "SpellsModel.h"

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
    qmlRegisterType<SpellsModel>("org.lasath.turbo_batman", 1, 0, "SpellsModel");
    qmlRegisterType<FilterProxyModel>("org.lasath.turbo_batman", 1, 0, "FilterProxyModel");
    qmlRegisterType<PreparedSpellsModel>("org.lasath.turbo_batman", 1, 0, "PreparedSpellsModel");
    qmlRegisterType<Completer>("org.lasath.turbo_batman", 1, 0, "Completer");


    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("spells.db");
    Q_ASSERT(db.open());

    ProjectContext turbo_batman;
    Sizes sizes;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("sizes", &sizes);
    engine.rootContext()->setContextProperty("turbo_batman", &turbo_batman);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
