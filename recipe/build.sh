#!/bin/bash

set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* config/

if [[ $target_platform == linux-* ]]; then
    EXTRA_ARGS=--enable-vfs-undelfs
fi

./configure                 \
    --prefix=$PREFIX        \
    --disable-debug         \
    --without-x             \
    --with-screen=slang     \
    $EXTRA_ARGS             \
    --enable-vfs-sftp || { cat config.log; exit 1; }

make -j$CPU_COUNT

make install
