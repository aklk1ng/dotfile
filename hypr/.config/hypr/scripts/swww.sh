#!/bin/bash

swww kill
swww init

export SWWW_TRANSITION_STEP=2

while true; do
    sleep 300
    swww img $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
done
