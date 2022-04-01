#!/bin/sh
set -e
killall pnt-lut &>/dev/null || true

mkfifo /tmp/pgm
mkfifo /tmp/pnt
mkfifo /tmp/haptic

echo "fifo init"

pnt-lut /tmp/pgm /tmp/pnt /tmp/haptic &

cat /usr/share/data/linear.pgm >/tmp/pgm
echo -ne "\x00\x00\x00\x00\x00\x00\x00\x00" >/tmp/pnt

diff /tmp/haptic /usr/share/data/onepoint.haptic

rm /tmp/pgm
rm /tmp/pnt
rm /tmp/haptic
