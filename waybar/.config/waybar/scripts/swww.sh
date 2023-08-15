#!/bin/bash

swww kill
swww init

let i=5
while true; do
    [ $((i % 500)) -eq 0 ] && swww img --transition-duration 1 --transition-fps 90 --transition-type wipe --transition-angle 30 $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
    sleep 10
    let i+=5
done
