#!/bin/sh

PLATFORM=`uname`
if [ "$PLATFORM" != "Linux" ]; then
    echo "Build static on $PLATFORM is not support!"
    exit 1
fi

case $1 in
    build|-b )
        make STATIC=1
        ;;
    clean|-c )
        make STATIC=1 clean
        ;;
    install|-i )
        if [ "$(whoami)" == "root" ]; then
            make STATIC=1 install
        else
            sudo make STATIC=1 install
        fi
        ;;
    * )
        echo "Usage: $(basename $0) {build|-b|clean|-c|install|-i}"
        ;;
esac
