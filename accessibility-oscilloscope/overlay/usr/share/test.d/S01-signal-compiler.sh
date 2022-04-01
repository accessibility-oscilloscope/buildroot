#!/bin/sh
set -e
killall signal-compiler &>/dev/null || true

# unit
signal-compiler /usr/share/data/linear.psignal /dev/stdout | diff - /usr/share/data/linear.pgm

# fuzzing
echo "144015" >signal.out
for _ in $(seq 0 5); do
    rand.psignal | signal-compiler /dev/stdin /dev/stdout | wc -c | diff - signal.out
done
rm signal.out
