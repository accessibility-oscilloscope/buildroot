#!/bin/sh
set -e
killall pnt-lut &>/dev/null || true

mkfifo /tmp/pgm
mkfifo /tmp/pnt
touch /tmp/haptic

echo "fifo init"

pnt-lut /tmp/pgm /tmp/pnt /dev/stdout | od -w2 -x >/tmp/haptic &

cat /usr/share/data/linear.pgm >/tmp/pgm
echo "00 10 00 00 00 00 00 00" | xxd -r -p >/tmp/pnt

diff /tmp/haptic /usr/share/data/onepoint.haptic

rm /tmp/pgm
rm /tmp/pnt
#rm /tmp/haptic
