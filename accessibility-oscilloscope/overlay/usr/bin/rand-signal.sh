#!/bin/sh

# fuzz a random oscilloscope signal

dd if=/dev/urandom of=/dev/stdout bs=1 count=480
