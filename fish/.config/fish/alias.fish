abbr --add la ls -A
abbr --add lla ll -A
abbr --add n fastfetch
abbr --add t tmux new-session -s dev
abbr --add ki nvim ~/.config/kitty/kitty.conf
abbr --add py python3
abbr --add rd nvim README.md
abbr --add lg lazygit
abbr --add j yazi

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

abbr --add di docker images
abbr --add dp docker pull
abbr --add dP docker push
abbr --add dr docker run
abbr --add ds docker stats
abbr --add dl docker logs

abbr --add g git
abbr --add ga git add
abbr --add gb git branch
abbr --add gt git tag
abbr --add gs git status
abbr --add gc git commit
abbr --add --position anywhere -- am --amend
abbr --add gp git pull
abbr --add gd git diff
abbr --add gf git fetch
abbr --add --command git c checkout
abbr --add --command git co commit
abbr --add --command git p push

abbr --add yayr "yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay -Rns"

abbr --add gitconfig "git config --global http.proxy http://127.0.0.1:7890 && git config --global https.proxy http://127.0.0.1:7890"
abbr --add npmconfig "npm config set proxy=http://127.0.0.1:7890"
