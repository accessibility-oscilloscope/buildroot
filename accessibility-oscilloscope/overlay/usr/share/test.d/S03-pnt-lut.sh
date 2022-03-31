#!/bin/sh

killall pnt-lut &>/dev/null

mkfifo /tmp/pgm
mkfifo /tmp/pnt
mkfifo /tmp/haptic

pnt-lut /tmp/pgm /tmp/pnt /tmp/haptic

cat /usr/share/data/linear.pgm > /tmp/pgm
echo -ne "\x42\x42" > /tmp/pnt

diff /tmp/haptic /usr/share/data/onepoint.haptic

rm /tmp/pgm
rm /tmp/pnt
rm /tmp/haptic
