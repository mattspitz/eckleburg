#!/bin/bash

# Captures a single frame into the correct directory, named by the time it was taken
BASE=/home/mspitz/src/eckleburg/capture
CAPTURE_DIR=frames
FSWEBCAM_CFG=fswebcam.cfg

FN=`TZ=UTC date +%Y%m%dT%H%M%SZ`.png
cd $BASE
fswebcam -c $FSWEBCAM_CFG $CAPTURE_DIR/$FN
