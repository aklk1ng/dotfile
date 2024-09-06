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
ok "Ending..."

dotfile_dir="$HOME/dotfile"
config_dir="$HOME/.config"
cache_dir="$HOME/.cache"
workspace_dir="$HOME/workspace"

action "Install packages by pacman"
sudo pacman -S stow git dunst chafa viu unzip unarchiver ninja curl grim zoxide tree-sitter clang \
    tmux keyd qt5-wayland git-delta qt6-wayland waybar fastfetch lua lua-language-server bash-language-server \
    bat ripgrep fd cmake man-pages gdb fzf lolcat npm yarn yt-dlp python-pip pyright \
    python python-requests watchexec slurp cloc swappy fish pamixer brightnessctl gvfs mpd mpv mpc ncmpcpp \
    network-manager-applet kitty lazygit wl-clipboard mupdf eza glow \
    fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-rime fcitx5-pinyin-zhwiki \
    swaybg qt5 --noconfirm
ok "Ending..."
bat cache --build

# git config
git config --global user.name "aklk1ng"
git config --global user.email "2628084745@qq.com"
git config --global core.editor "nvim"
git config --global core.ui true
git config --global http.postBuffer 5242880
git config --global https.postBuffer 5242880
git config --global init.defaultBranch 'main'

action "Create neccessary directory"
if [[ ! -d "$dotfile_dir" ]]; then
    mkdir "$dotfile_dir" -p
fi
if [[ ! -d "$workspace_dir" ]]; then
    mkdir "$workspace_dir" -p
fi
if [[ ! -d "$config_dir" ]]; then
    mkdir "$config_dir" -p
fi
if [[ ! -d "$cache_dir" ]]; then
    mkdir "$cache_dir" -p
fi
ok "Ending..."

action "Clone neovim config"
git clone https://github.com/aklk1ng/nvim "$HOME/.config/nvim"
ok "Ending..."

action "Linking config files"
cd "$dotfile_dir"
for file in $(find . -maxdepth 1 -type d -printf '%P\n'); do
    if [[ "$file" != "fonts" ]] && [[ "$file" != "keyd" ]] && [[ "$file" != "kanata" ]] && [[ "$file" != ".git" ]]; then
        stow $file
    fi
done
ok "Ending..."

action "Install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
ok "Ending..."

action "Install paru"
git clone https://aur.archlinux.org/paru.git $HOME/paru
cd "$HOME/paru"
makepkg -si
ok "Ending..."

action "Install packages by paru"
paru -S fcitx5-skin-fluentdark-git hyprland \
    swaylock-effects-git clipman rofi-lbonn-wayland-git \
    wlogout xdg-desktop-portal-hyprland \
    yazi-git --noconfirm
ok "Ending..."

action "Config mpd"
touch "$cache_dir/log"
touch "$cache_dir/database"
touch "$config_fir/mpd/pid"
touch "$config_fir/mpd/state"
touch "$config_fir/mpd/sticker.sql"
mkdir "$config_fir/mpd/playlists"
ok "Ending..."

action "Copy fonts"
sudo cp "$dotfile_dir/fonts/"* -r /usr/share/fonts/
sudo fc-cache -v
ok "Ending..."

action "Use fish shell"
chsh -s "$(which fish)"
sudo chsh -s "$(which fish)"
ok "Ending..."

action "Start mpd service"
systemctl enable mpd.service --user
systemctl start mpd.service --user
ok "Ending..."

action "Clone repos"
cd "$HOME"
git clone https://github.com/aklk1ng/yt-dlp.git --depth 1
git clone https://github.com/aklk1ng/scripts.git --depth 1
git clone https://github.com/aklk1ng/wallpaper.git --depth 1
ok "Ending..."

action "Config keyd"
if [[ ! -d /etc/keyd ]]; then
    sudo mkdir /etc/keyd
fi
sudo cp "$dotfile/keyd/default.conf" /etc/keyd/default.conf
sudo systemctl enable keyd.service
sudo systemctl start keyd.service
ok "Ending..."
