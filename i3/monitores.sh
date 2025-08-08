#!/bin/bash
xrandr --output DP-0 --mode 1920x1080 --rate 165 --pos 0x0 --primary \
       --output HDMI-0 --mode 1600x900 --rate 60 --left-of DP-0
