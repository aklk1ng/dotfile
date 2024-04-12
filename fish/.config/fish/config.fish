set fish_greeting ""

set -gx EDITOR nvim
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx HOMEBREW_NO_AUTO_UPDATE 1
# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set -gx FZF_DEFAULT_OPTS "--color 16 --reverse --preview 'bat --color=always {}' --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down -m"

source ~/.config/fish/alias.fish

if status is-interactive
    setproxy
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
end

function fish_mode_prompt
end

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec Hyprland
    end
end

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" >/dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH
zoxide init fish | source
