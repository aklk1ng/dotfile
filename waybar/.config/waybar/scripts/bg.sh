#!/bin/bash

swww img --transition-fps 90 --transition-type wipe --transition-angle 30 $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
