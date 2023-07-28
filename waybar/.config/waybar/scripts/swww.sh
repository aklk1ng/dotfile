#!/bin/bash

swww kill
swww init

export SWWW_TRANSITION_STEP=1

let i=5
while true; do
    [ $((i % 500)) -eq 0 ] && swww img $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
    sleep 10
    let i+=5
done
