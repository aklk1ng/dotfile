alias ls "ls --color=auto"
alias la "ls -A"
alias ll "eza -l --icons"
alias lla "ll -A"
alias f "fzf --reverse --preview 'bat {}' --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down | xargs -n 1 nvim"
alias n fastfetch
alias t "tmux new-session -s 🎵"
alias ki "nvim ~/.config/kitty/kitty.conf"
alias py python3
alias readme "nvim README.md"
alias lg lazygit

alias H Hyprland

alias j yazi

alias reload "source ~/.config/fish/config.fish"

alias c cargo
alias cn "cargo new"
alias ca "cargo add"
alias cb "cargo build"
alias cr "cargo run"
alias crb "cargo run --bin"
alias ct "cargo test"
alias ci "cargo install"
alias cc "cargo clean"

alias zr "zig run"
alias zt "zig test"
alias zb "zig build"
alias zl "zig init-lib"
alias ze "zig init-exe"

alias di "docker images"
alias dp "docker pull"
alias dP "docker push"
alias dr "docker run"
alias ds "docker stats"
alias dl "docker logs"

alias g git
alias ga "git add"
alias gaa "git add ."
alias gb "git branch"
alias gbm "git branch -M"
alias gs "git status"
alias gcm "git commit -m"
alias gp "git pull"
alias gpo "git push origin"
alias gd "git diff"
alias gf "git fetch"

alias yayq="yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay -Rns"

alias gitconfig "git config --global http.proxy http://127.0.0.1:7890 && git config --global https.proxy http://127.0.0.1:7890"
alias npmconfig "npm config set proxy=http://127.0.0.1:7890"
alias setproxy "export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5:://127.0.0.1:7890"
