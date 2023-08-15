#!/bin/bash

swww kill
swww init

while [[ true ]]; do
    swww img $(find ~/wallpaper/bg/ -name "*.png" | shuf -n1)
    sleep 300
done
