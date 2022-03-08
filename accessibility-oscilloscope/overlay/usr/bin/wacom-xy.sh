#!/bin/sh

DEVICE=$(libinput list-devices | grep "Wacom Intuos BT M Pen" -A1 | awk '/Kernel:/ {print $2}')
libinput record "$DEVICE" | awk '/EV_ABS \/ (ABS_X|ABS_Y)/ { print $12 }'
