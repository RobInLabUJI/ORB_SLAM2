#!/bin/bash

export IP=150.128.100.192

docker run -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v /Users/ecervera/Datasets/TUM_Dataset:/tmp/TUM_Dataset:rw -it --rm orb_slam2