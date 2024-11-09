#!/bin/bash

swaybg -i $(find ~/wallpaper/bg/* | shuf -n1) -m fill &

sleep 1
cur=$(ps aux | grep swaybg | grep -v grep | awk '{print $2}' | tail -n 1)
for pid in $(pgrep -f swaybg); do
    if [[ $pid != $cur ]]; then
        kill $pid
    fi
done
