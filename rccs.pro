TEMPLATE = app

QT += qml quick widgets sql
CONFIG += c++11
CONFIG+=qml_debug

SOURCES += main.cpp \
    Attribute.cpp \
    Modifier.cpp \
    Sizes.cpp \
    ModifierSource.cpp \
    Spell.cpp \
    SpellsModel.cpp \
    ProjectContext.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    Attribute.h \
    Modifier.h \
    Sizes.h \
    ModifierSource.h \
    Spell.h \
    SpellsModel.h \
    ProjectContext.h

OTHER_FILES += \
    init_db.py
