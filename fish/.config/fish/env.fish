set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/var"

set -gx EDITOR (which nvim)
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOBIN "$XDG_DATA_HOME/go/bin"
set -gx PATH "$GOPATH/bin" $PATH
set -gx GO111MODULE on
set -gx GOPROXY https://goproxy.cn

set -gx MANPAGER "nvim +Man!"

set -gx FZF_DEFAULT_OPTS "--color 16 --reverse --border=none --preview 'bat --color=always {}' --bind ctrl-y:select-all+accept,ctrl-h:backward-word,ctrl-l:forward-word,ctrl-u:half-page-up,ctrl-d:half-page-down,ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up,ctrl-k:first,ctrl-j:last -m"
