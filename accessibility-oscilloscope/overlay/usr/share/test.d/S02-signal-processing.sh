#!/bin/sh

killall sigproc &>/dev/null

sigproc -i /usr/share/data/linear.signal -o /dev/stdout | diff - /usr/share/data/linear.psignal
echo "sigproc:" $?
