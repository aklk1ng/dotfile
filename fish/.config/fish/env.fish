set -gx EDITOR nvim
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set -gx MANPAGER "nvim +Man!"

set -gx FZF_DEFAULT_OPTS "--color 16 --reverse --preview 'bat --color=always {}' --bind ctrl-y:select-all+accept,ctrl-u:half-page-up,ctrl-d:half-page-down,ctrl-h:first,ctrl-l:last -m"
