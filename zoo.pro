QT += core
QT -= gui

CONFIG += c++11

TARGET = zoo
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
           database.cpp

HEADERS += database.h

LIBS += -lmysqlclient

INCLUDEPATH += /mingw64/include/mysql

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target