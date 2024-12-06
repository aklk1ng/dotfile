#!/bin/bash

prev_hook() {
    killall -q clash
    cd $XDG_DATA_HOME/clash || return
}

main() {
    prev_hook
    config=$(
        ls -a *.yaml | xargs -I@ basename -s .yaml @ | fzf \
            --cycle \
            --header='Switch config' \
            --header-first \
            --height=10 \
            --preview '' \
            --preview-window=bottom:1:wrap,border-up
    )
    [[ -z "$config" ]] && exit 0
    exec $(echo mihomo -f "$config".yaml -d . &)
}

case "$1" in
*)
    main
    ;;
esac
