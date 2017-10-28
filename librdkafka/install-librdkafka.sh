#!/usr/bin/env bash

LIBRDKAFKA_VERSION="261371dc0edef4cea9e58a076c8e8aa7dc50d452"

PROJECT=$PWD
DEST="/usr/local"
VERSION_FILE="/librdkafka-version.txt"

echo "Making librdkafka ($LIBRDKAFKA_VERSION)"
SRC=`mktemp -d 2>/dev/null || mktemp -d -t 'rdkafka'`
git clone https://github.com/edenhill/librdkafka "$SRC"
cd $SRC
git reset $LIBRDKAFKA_VERSION --hard

./configure --prefix $DEST
cd src
make && make install

rm -rf "$SRC" /install-librdkafka.sh

echo "Writing version file to $VERSION_FILE"
echo $LIBRDKAFKA_VERSION > $VERSION_FILE
