#!/bin/bash

# Captures a single frame into the correct directory, named by the time it was taken
BASE=/home/mspitz/src/eckleburg/capture
CAPTURE_DIR=frames
FSWEBCAM_CFG=fswebcam.cfg

FN=`TZ=UTC date +%Y%m%dT%H%M%SZ`.png

# set webcam properties (see v4l2-ctl -L for a list)

v4l2-ctl -c brightness=128                     # 0 to 255
v4l2-ctl -c contrast=128                       # 0 to 255
v4l2-ctl -c saturation=128                     # 0 to 255
v4l2-ctl -c white_balance_temperature_auto=1   # 0 or 1
#v4l2-ctl -c white_balance_temperature=4650    # 0 to 10000 (irrelevant if white_balance_temperature_auto = 1)
v4l2-ctl -c gain=128                           # 0 to 255
v4l2-ctl -c power_line_frequency=2             # Disabled, 50Hz or 60Hz
v4l2-ctl -c sharpness=255                      # 0 to 255
v4l2-ctl -c backlight_compensation=2           # 0 to 2
v4l2-ctl -c exposure_auto=3                    # 1=Manual, 3=Aperture Priority Mode
#v4l2-ctl -c exposure_absolute=512             # 1 to 10000 (irrelvant if exposure_auto != 1)
v4l2-ctl -c exposure_auto_priority=0           # 0 or 1

cd $BASE
fswebcam -c $FSWEBCAM_CFG $CAPTURE_DIR/$FN
