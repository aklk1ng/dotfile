abbr --add ls ls --color=auto
abbr --add la ls -A
abbr --add ll eza -l --icons
abbr --add lla ll -A
abbr --add n fastfetch
abbr --add t tmux new-session -s dev
abbr --add ki nvim ~/.config/kitty/kitty.conf
abbr --add py python3
abbr --add readme nvim README.md
abbr --add lg lazygit
abbr --add j yazi

abbr --add H Hyprland

abbr --add wa watchexec

abbr --add c cargo
abbr --add cn cargo new
abbr --add ca cargo add
abbr --add cb cargo build
abbr --add cr cargo run
abbr --add crb cargo run --bin
abbr --add ct cargo test
abbr --add ci cargo install
abbr --add cc cargo clean

abbr --add zr zig run
abbr --add zt zig test
abbr --add zb zig build
abbr --add zl zig init-lib
abbr --add ze zig init-exe

abbr --add di docker images
abbr --add dp docker pull
abbr --add dP docker push
abbr --add dr docker run
abbr --add ds docker stats
abbr --add dl docker logs

abbr --add g git
abbr --add ga git add
abbr --add gb git branch
abbr --add gc git checkout
abbr --add gbm git branch -M
abbr --add gs git status
abbr --add gcm git commit -m
abbr --add gp git pull
abbr --add gpo git push origin
abbr --add gd git diff
abbr --add gf git fetch

abbr --add paruq "paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro yay -Rns"

abbr --add gitconfig "git config --global http.proxy http://127.0.0.1:7890 && git config --global https.proxy http://127.0.0.1:7890"
abbr --add npmconfig "npm config set proxy=http://127.0.0.1:7890"
