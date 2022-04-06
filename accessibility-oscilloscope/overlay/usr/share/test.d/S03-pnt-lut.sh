#!/bin/sh
set -e
killall pnt-lut &>/dev/null || true

hex_string() {
    echo $1 | xxd -r -p
}

mkfifo /tmp/pgm
mkfifo /tmp/pnt

pnt-lut /tmp/pgm /tmp/pnt /dev/stdout | od -w2 -x | tee /tmp/haptic &
cat /usr/share/data/gradient-x.pgm >/tmp/pgm
hex_string "00 10 00 00 00 00 00 00" >/tmp/pnt
hex_string "00 20 00 00 00 00 00 00" >/tmp/pnt
hex_string "00 30 00 00 00 00 00 00" >/tmp/pnt
hex_string "00 40 00 00 00 00 00 00" >/tmp/pnt
killall pnt-lut
diff /tmp/haptic /usr/share/data/gradient-x.haptic
rm /tmp/haptic

pnt-lut /tmp/pgm /tmp/pnt /dev/stdout | od -w2 -x >/tmp/haptic &
cat /usr/share/data/gradient-x.pgm >/tmp/pgm
hex_string "00 10 00 00 00 00 00 00" >/tmp/pnt
cat /usr/share/data/gradient-y.pgm >/tmp/pgm
hex_string "00 10 00 00 00 00 00 00" >/tmp/pnt
killall pnt-lut
#diff /tmp/haptic /usr/share/data/gradient-x.haptic
rm /tmp/haptic

rm /tmp/pgm
rm /tmp/pnt
