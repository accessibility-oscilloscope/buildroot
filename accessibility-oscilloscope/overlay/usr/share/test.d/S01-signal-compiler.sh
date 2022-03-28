#!/bin/sh

killall signal-compiler &>/dev/null

signal-compiler /usr/share/data/linear.psignal /dev/stdout | diff - /usr/share/data/linear.pgm
echo "signal-compiler:" $?
