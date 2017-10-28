#!/usr/bin/env bash

ROCKSDB_VERSION=5.8
DEST="/usr/local"
VERSION_FILE="$DEST/rocksdb-version.txt"

echo "Making rocksdb ($ROCKSDB_VERSION)"
SRC=`mktemp -d 2>/dev/null || mktemp -d -t 'rocksdb'`
git clone https://github.com/facebook/rocksdb "$SRC"
cd $SRC
git reset --hard v${ROCKSDB_VERSION}
INSTALL_PATH=$DEST make static_lib
INSTALL_PATH=$DEST make shared_lib
INSTALL_PATH=$DEST make install
rm -rf $SRC

echo "Writing version file to $VERSION_FILE"
echo $ROCKSDB_VERSION > $VERSION_FILE
