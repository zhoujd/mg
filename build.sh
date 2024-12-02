#!/bin/sh

PLATFORM=`uname`
if [ $PLATFORM != "Linux" ] ; then
    echo "Build static on $PLATFORM is not support!"
    exit 1
fi

dep() {
    sudo apt install -y libbsd-dev
    echo "Install dependence done"    
}

case $1 in
    dep )
        dep
        ;;
    build|-b )
        make
        ;;
    clean|-c )
        make clean
        ;;
    * )
        echo "Usage: $(basename $0) {dep|build|-b|clean|-c}"
        ;;
esac
