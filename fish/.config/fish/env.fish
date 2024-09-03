set -gx EDITOR nvim
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set -gx MANPAGER "nvim +Man!"

set -gx FZF_DEFAULT_OPTS "--color 16 --reverse --preview 'bat --color=always {}' --bind ctrl-y:select-all+accept,ctrl-b:half-page-up,ctrl-f:half-page-down,ctrl-j:last,ctrl-k:first -m"
