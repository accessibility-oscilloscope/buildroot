#!/bin/sh

if [ -z ${DEFCONFIG+x} ]; then
    echo "DEFCONFIG unset! use `export DEFCONFIG=BOARD`. see README"
    exit 1
fi

# add any further dev env variables here
export BR2_EXTERNAL=../accessibility-oscilloscope
export BR2_DL_DIR=$(pwd)/dl
export MENUCONFIG_COLOR=mono # the default ncurses colors are shitty imho

make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output $1
