#!/bin/bash

# compile antializes-qt
curl https://qt.gitorious.org/qt/antializes-qt/archive/08c134d0b8a541cbb7ab6396baff1f07fe437d98.tar.gz | tar xz
cd /qt-antializes-qt
QTDIR=. ./bin/syncqt
./configure -nomake "tools examples demos docs translations" -opensource -confirm-license -prefix ../wkqt
make -j3 && make install

# Remove clone of QT because it takes a lot of space
cd / && rm /qt-antializes-qt -rf
