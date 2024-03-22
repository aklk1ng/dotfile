#! /bin/bash

call_ncmpcpp() {
    pid=$(ps aux | grep 'kitty -T ncmpcpp' | grep -v grep | awk '{print $2}')
    kill $pid || kitty -T ncmpcpp --class floating -e ncmpcpp
}

case "$1" in
L) call_ncmpcpp ;;
M) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
R) mpc toggle ;;
esac
