#! /bin/bash

call_ncmpcpp() {
    pid1=$(ps aux | grep 'kitty -T music' | grep -v grep | awk '{print $2}')
    pid2=$(ps aux | grep 'kitty -T music_ncmpcpp' | grep -v grep | awk '{print $2}')
    kill $pid1 && kill $pid2 || kitty -T music_ncmpcpp --class floating -e ncmpcpp
}

case "$1" in
L) call_ncmpcpp ;;
M) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
R) mpc toggle ;;
esac
