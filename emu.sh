#!/bin/sh

qemu-system-arm -M versatilepb \
    -kernel "$1"/images/zImage \
    -dtb "$1"/images/versatile-pb.dtb \
    -drive file="$1"/images/rootfs.ext2,if=scsi \
    -append root=/dev/sda \
    -nographic
