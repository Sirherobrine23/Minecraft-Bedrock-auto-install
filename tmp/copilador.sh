#!/bin/bash
NAME="$(cat ./DEBIAN/control | grep 'Package:' | sed 's|Package: ||g' | sed 's|Package:||g')"
VERSION="$(cat ./DEBIAN/control | grep 'Version: ' | sed 's|Version: ||g')"
ARQUITETURA="$(cat ./DEBIAN/control | grep 'Architecture: ' | sed 's|Architecture: ||g')"
DIR="."
DIR_TMP="/tmp/deb-copiler"
DIR_OUTPUT="./tmp"
TD=$(echo "$DIR_OUTPUT/$NAME $VERSION $ARQUITETURA" | sed 's| |_|g')
mkdir -p "$DIR_TMP"
cp -rf "$DIR" "$DIR_TMP"
rm -rf "$DIR_TMP/LICENSE"
rm -rf "$DIR_TMP/*git*"
echo "$DIR_TMP $TD.deb"
dpkg-deb -b $DIR_TMP $TD.deb
