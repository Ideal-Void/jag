######################################################################
# This file is part of JAG, Puzzle game where the goal is to break all
# the target pieces in each level and do this before the time runs out.
#
# Many thanks to XlabSoft & Ind. Infosystems, the originals authors of JAG.
#
# Copyright holder 2009-2012 Developed by XlabSoft & Industrial Infosystems
# Work continued by 2017-2020 Carlos Donizete Froes [a.k.a coringao]
#
# JAG is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.
######################################################################

TEMPLATE = app
TARGET = jag-editor
INCLUDEPATH += .

QT += gui core widgets xml x11extras
QMAKE_CXXFLAGS += -g -std=gnu++14 -fPIE -D_FORTIFY_SOURCE=2
QMAKE_LFLAGS += -lpthread -pie -Wl,--as-needed -Wl,-z,now

unix: {
	target.path = /usr/games/
	INSTALLS += target
	datas.path = /usr/share/games/jag/editor/
	datas.files = images
	INSTALLS += datas
}

# The following define makes your compiler warn you if you use any
# feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Input
HEADERS += defines.h levelpack.h levelwidget.h mainwindow.h
FORMS += levelpack.ui mainwindow.ui
SOURCES += levelpack.cpp levelwidget.cpp main.cpp mainwindow.cpp
RESOURCES += editor.qrc

# Removing the config.dat file after running the compiled binary.
QMAKE_CLEAN += config.dat
