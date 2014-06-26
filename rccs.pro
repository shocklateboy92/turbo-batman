TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11
CONFIG+=qml_debug

SOURCES += main.cpp \
    Attribute.cpp \
    Modifier.cpp \
    Sizes.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    Attribute.h \
    Modifier.h \
    Sizes.h
