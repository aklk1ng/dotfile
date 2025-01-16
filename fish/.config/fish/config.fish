if not status is-interactive
    return 0
end

set -U fish_greeting

source $HOME/.config/fish/alias.fish
source $HOME/.config/fish/env.fish

setproxy
set fish_vi_force_cursor 1
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

function fish_mode_prompt
end

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec Hyprland
    end
end

zoxide init fish | source
