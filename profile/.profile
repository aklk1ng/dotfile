export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export DWM=~/.config/dwm
export SCREEN_MODE=ONE
. "$HOME/.cargo/env"
# >>> xmake >>>
test -f "/home/cjh/.xmake/profile" && source "/home/cjh/.xmake/profile"
# <<< xmake <<<
