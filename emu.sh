#!/bin/sh

qemu-system-arm -M versatilepb \
	-kernel qemu_output/images/zImage \
	-dtb qemu_output/images/versatile-pb.dtb \
	-drive file="$1",if=scsi \
	-append root=/dev/sda \
	-nographic
	-monitor none
