set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/.erg/bin $PATH
set -gx PATH ~/.local/share/bob/nvim-bin/ $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx HOMEBREW_NO_AUTO_UPDATE 1
# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# alias commands
source ~/.config/fish/alias.fish

# run command every login
if status is-interactive
  proxy-clash
end

function fish_mode_prompt; end
