#!/bin/bash

swww query
if [ $? -eq 1 ]; then
    swww init
fi

while true; do
    sleep 300
    swww img --transition-type wipe --transition-duration 2 --transition-fps 90 --transition-angle 30 $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
done
