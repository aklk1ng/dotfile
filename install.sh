#! /bin/bash

source ./util.sh

action "Define the environment variables"
ENV_VARS=(
    # 'GTK_IM_MODULE=fcitx5'
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
sudo pacman -S git dunst unzip ninja curl grim zoxide tree-sitter \
    python python-requests watchexec slurp swappy fish pamixer brightnessctl gvfs mpd mpc ncmpcpp \
    tmux qt5-wayland qt6-wayland waybar fastfetch lua lua-language-server bat ripgrep fd cmake fzf lolcat npm yarn yt-dlp \
    network-manager-applet kitty lazygit wl-clipboard mupdf eza glow \
    fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-rime fcitx5-pinyin-zhwiki \
    swaybg qt5 --noconfirm
ok "ending..."
bat cache --build

# git config
git config --global user.name "aklk1ng"
git config --global user.email "2628084745@qq.com"
git config --global core.editor "nvim"
git config --global core.ui true
git config --global http.postBuffer 5242880
git config --global https.postBuffer 5242880
git config --global init.defaultBranch 'main'

action "create neccessary directory"
if [[ ! -d $dotfile_dir ]]; then
    mkdir $dotfile_dir -p
fi
if [[ ! -d $workspace_dir ]]; then
    mkdir $workspace_dir -p
fi
if [[ ! -d $config_dir ]]; then
    mkdir $config_dir -p
fi
if [[ ! -d $cache_dir ]]; then
    mkdir $cache_dir -p
fi
ok "ending..."

action "clone neovim config"
git clone https://github.com/aklk1ng/whiskyline.nvim --depth 1 $workspace_dir
git clone https://github.com/aklk1ng/nvim $HOME/.config/nvim
ok "ending..."

action "linking config files"
cd $dotfile_dir
for file in $(find . -maxdepth 1 -type d -printf '%P\n'); do
    if [[ $file != "fonts" ]] && [[ $file != "vim" ]] && [[ $file != "keyd" ]]; then
        stow $file
    fi
done
ok "ending..."

action "Install paru"
cd $HOME
git clone https://aur.archlinux.org/paru.git
cd $HOME/paru
makepkg -si
ok "ending..."

action "Install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
ok "ending..."

action "Install packages by paru"
paru
paru -S fcitx5-skin-fluentdark-git cava hyprland \
    whitesur-gtk-theme whitesur-icon-theme whitesur-cursor-theme-git \
    swaylock-effects-git rofi-lbonn-wayland-git wlogout \
    xdg-desktop-portal-hyprland \
    keyd yazi-git --noconfirm
ok "ending..."

action "config mpd"
touch $cache_dir/log
touch $cache_dir/database
touch $config_fir/mpd/pid
touch $config_fir/mpd/state
touch $config_fir/mpd/sticker.sql
mkdir $config_fir/mpd/playlists
ok "ending..."

action "copy fonts"
sudo cp $dotfile_dir/fonts -r /usr/share/fonts/
sudo fc-cache -v
ok "ending..."

action "save fish theme"
sudo chsh -s $(which fish)
fish_config theme save aklk1ng
ok "ending..."

action "start mpd service"
systemctl start mpd.service --user
ok "ending..."

action "clone repos"
cd $HOME
git clone https://github.com/aklk1ng/yt-dlp.git --depth 1
git clone https://github.com/aklk1ng/scripts.git --depth 1
git clone https://github.com/aklk1ng/wallpaper.git --depth 1
ok "ending..."

action "config keyd"
cd $dotfile
if [[ ! -d /etc/keyd ]]; then
    sudo mkdir /etc/keyd
fi
if [[ ! -e /etc/keyd/default.conf ]]; then
    sudo cp $dotfile/keyd/default.conf /etc/keyd/default.conf
fi
systemctl enable keyd.service
systemctl start keyd.service
action "clean repo"
rm -rf keyd
ok "ending..."
