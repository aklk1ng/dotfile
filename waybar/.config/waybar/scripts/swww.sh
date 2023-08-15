#!/bin/bash

swww kill
swww init

while true; do
    swww img --transition-duration 1 --transition-fps 90 --transition-type wipe --transition-angle 30 $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
    sleep 300
done
