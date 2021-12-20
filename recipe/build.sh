#!/bin/bash

set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* config/

./configure                 \
    --prefix=$PREFIX        \
    --disable-debug         \
    --without-x             \
    --with-screen=slang     \
    --enable-vfs-sftp || { cat config.log; exit 1; }

make -j$CPU_COUNT

make install
