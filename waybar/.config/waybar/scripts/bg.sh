#!/bin/bash

swww img --transition-type wipe --transition-duration 2 --transition-fps 90 --transition-angle 30 $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
