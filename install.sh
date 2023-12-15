#! /bin/bash

source ./util.sh

action "Define the environment variables"
ENV_VARS=(
    'GTK_IM_MODULE=fcitx5'
    # 'GTK_IM_MODULE=wayland'
    'QT_IM_MODULE=fcitx5'
    'XMODIFIERS=@im=fcitx5'
    'SDL_IM_MODULE=fcitx5'
    'GLFW_IM_MODULE=ibus'
    'XCURSOR_SIZE=30'
)

# Loop through the environment variables and add them to /etc/environment
for var in "${ENV_VARS[@]}"; do
    echo "$var" | sudo tee -a /etc/environment
done
ok "ending..."

dotfile_dir=$HOME/dotfile
config_dir=$HOME/.config
cache_dir=$HOME/.cache
workspace_dir=$HOME/workspace

action "Install packages by pacman"
sudo pacman -S git dunst unzip lxappearance ninja curl xfce4-settings grim zoxide tree-sitter \
    python-requests python-pipx slurp swappy fish pamixer brightnessctl gvfs mpd mpc ncmpcpp \
    ranger tmux qt5-wayland qt6-wayland waybar fastfetch lua lua-language-server bat ripgrep cmake fzf lolcat npm yarn yt-dlp \
    network-manager-applet kitty lazygit wl-clipboard mupdf eza wofi glow \
    swaybg --noconfirm
ok "ending..."
bat cache --build

# git config
git config --global user.name "aklk1ng"
git config --global user.email "2628084745@qq.com"
git config --global core.editor "nvim"
git config --global core.ui true
git config --global http.postBuffer 5242880
git config --global https.postBuffer 5242880

action "clone neovim config"
git clone https://github.com/aklk1ng/whiskyline.nvim --depth 1 $workspace_dir
git clone https://github.com/aklk1ng/nvim $HOME/.config/nvim
ok "ending..."

if [[ ! -d $dotfile_dir ]]; then
    mkdir $dotfile_dir
fi

action "Install yay"
cd $dotfile_dir
stow profile
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd $HOME/yay
makepkg -si
ok "ending..."

action "Install packages by yay"
yay -Syu
yay -S hyprland cava rustup \
    swaylock-effects wlogout \
    xdg-desktop-portal-hyprland \
    keyd yazi-git --noconfirm
ok "ending..."

action "Install hypr-empty"
cargo install --git https://github.com/aklk1ng/hypr-empty.git
ok "ending..."

cd $dotfile_dir

action "linking dotfiles"
if [[ ! -d $config_dir ]]; then
    mkdir $config_dir
fi
stow chrome-flags fish dunst kitty mpd ncmpcpp yazi wofi tmux hypr swaylock waybar cava bat gtk3 hypr-empty
ok "ending..."

action "config mpd"
if [[ ! -d $cache_dir ]]; then
    mkdir $cache_dir
fi
touch $cache_dir/log
touch $cache_dir/database
touch $config_fir/mpd/pid
touch $config_fir/mpd/state
touch $config_fir/mpd/sticker.sql
mkdir $config_fir/mpd/playlists
ok "ending..."

action "copy fonts"
sudo cp $dotfile_dir/FiraCode -r /usr/share/fonts/
sudo fc-cache -v
ok "ending..."

action "save fish theme"
fish_config theme save Base16\ Default\ Dark
sudo chsh -s $(which fish)
ok "ending..."

action "start mpd service"
systemctl start mpd.service --user
ok "ending..."

cd $HOME
action "clone repos"
git clone https://github.com/aklk1ng/yt-dlp.git --depth 1
git clone https://github.com/aklk1ng/scripts.git --depth 1
git clone https://github.com/aklk1ng/wallpaper.git --depth 1
git clone https://github.com/aklk1ng/keyd.git --depth 1
ok "ending..."

action "start keyd"
sudo cp keyd/default.conf /etc/keyd/
systemctl enable keyd.service
systemctl start keyd.service
ok "ending..."
