TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc \
    fonts.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model

# Default rules for deployment.
include(deployment.pri)
