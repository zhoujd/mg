#!/bin/sh

PLATFORM=`uname`
if [ $PLATFORM != "Linux" ] ; then
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
    * )
        echo "Usage: $(basename $0) {build|-b|clean|-c}"
        ;;
esac
