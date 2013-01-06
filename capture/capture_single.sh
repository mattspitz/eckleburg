#!/bin/bash

# Captures a single frame into the correct directory, named by the time it was taken
BASE=/home/mspitz/src/eckleburg/capture
CAPTURE_DIR=frames
FSWEBCAM_CFG=fswebcam.cfg

FN=`TZ=UTC date +%Y%m%dT%H%M%SZ`.png

# set webcam properties (see v4l2-ctl -L for a list)

v4l2-ctl -c brightness=0                        # -10 to 10
v4l2-ctl -c contrast=10                         # 0 to 20
v4l2-ctl -c saturation=5                        # 0 to 10
v4l2-ctl -c white_balance_temperature_auto=1    # 0 or 1
#v4l2-ctl -c white_balance_temperature=4650      # 2800 to 6500 (irrelevant if white_balance_temperature_auto = 1)
v4l2-ctl -c gamma=150                           # 100 to 200
v4l2-ctl -c power_line_frequency=2              # Disabled, 50Hz or 60Hz
v4l2-ctl -c sharpness=10                        # 0 to 10
v4l2-ctl -c exposure_auto=3                     # 1=Manual, 3=Aperture Priority Mode
#v4l2-ctl -c exposure_absolute=512               # 8 to 16384 (irrelvant if exposure_auto != 1)
v4l2-ctl -c focus_auto=1                        # 0 or 1
#v4l2-ctl -c focus_absolute=0                    # 0 to 20 (irrelevant if focus_auto = 1)

cd $BASE
fswebcam -c $FSWEBCAM_CFG $CAPTURE_DIR/$FN
