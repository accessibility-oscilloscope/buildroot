#!/bin/sh
set -e
killall sigproc &>/dev/null || true

sigproc -i /usr/share/data/linear.signal -o /dev/stdout | diff - /usr/share/data/linear.psignal
echo "sigproc:" $?
