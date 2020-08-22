#!/bin/bash

# script set in background
setsid /apps/install.sh > output.txt &


# run systemd
exec /usr/sbin/init
