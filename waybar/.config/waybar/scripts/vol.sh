#! /bin/bash

call_ncmpcpp() {
    pid1=$(ps aux | grep 'st -t music' | grep -v grep | awk '{print $2}')
    pid2=$(ps aux | grep 'st -t music_ncmpcpp' | grep -v grep | awk '{print $2}')
    mx=$(xdotool getmouselocation --shell | grep X= | sed 's/X=//')
    my=$(xdotool getmouselocation --shell | grep Y= | sed 's/Y=//')
    kill $pid1 && kill $pid2 || st -t music_ncmpcpp -g 40x10+$((mx - 90))+$((my)) -c stfloating -A 0.7 -e ncmpcpp
}

case "$1" in
L) call_ncmpcpp ;;
M) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
R) mpc toggle ;;
esac
