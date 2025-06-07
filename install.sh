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
if [ $? -ne 0 ]; then
    echo 'Your account will be locked!!!'
    exit 1
fi
ok "Ending..."

dotfile_dir="$HOME/dotfile"
config_dir="$HOME/.config"
cache_dir="$HOME/.cache"
workspace_dir="$HOME/workspace"

action "Install packages by pacman"
sudo pacman -S stow github-cli dunst zip unzip unarchiver ninja curl grim zoxide tree-sitter-cli clang \
    tmux keyd poppler git-delta qt5 qt6-wayland waybar fastfetch lua lua-language-server bash-language-server \
    bat ripgrep fd cmake ccache man netcat man-pages gdb fzf gopls npm yt-dlp python-pip pyright \
    python python-requests ttf-fira-code ttf-firacode-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono watchexec \
    ueberzugpp yazi slurp tokei rofi-wayland swappy downgrade fish pamixer brightnessctl gvfs mpv network-manager-applet \
    pipewire wireplumber xdg-desktop-portal-hyprland hyprland hyprpaper hyprlock kitty firefox lazygit \
    wl-clipboard mupdf eza visidata glow fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-rime fcitx5-pinyin-zhwiki \
    pulseaudio pulseaudio-alsa bluez bluez-utils pulseaudio-bluetooth --noconfirm
ok "Ending..."

action "Config git"
git config --global user.name "aklk1ng"
git config --global user.email "2628084745@qq.com"
git config --global core.editor "nvim"
git config --global core.ui true
git config --global core.pager delta
git config --global delta.syntax-theme zenburn
git config --global delta.line-numbers true
git config --global delta.dark true
git config --global http.postBuffer 5242880
git config --global https.postBuffer 5242880
git config --global init.defaultBranch 'main'
ok "Ending..."

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
for file in $(find . -maxdepth 1 -type d -not -name '.*' -printf '%P\n'); do
    if [[ "$file" != "keyd" ]]; then
        stow $file
    fi
done
ok "Ending..."

action "Refresh bat cache"
bat cache --build
ok "Ending..."

action "Install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
ok "Ending..."

action "Config go proxy"
echo "export GO111MODULE=on" >>~/.profile
echo "export GOPROXY=https://goproxy.cn" >>~/.profile
source ~/.profile
ok "Ending..."

action "Install yay"
git clone https://aur.archlinux.org/yay.git $HOME/yay
cd "$HOME/yay"
makepkg -si
ok "Ending..."

action "Install packages by yay"
yay -S clipman wlogout mihomo-party-xs-bin --noconfirm
ok "Ending..."

action "Use fish shell"
chsh -s "$(which fish)"
sudo chsh -s "$(which fish)"
ok "Ending..."

action "Enable bluetooth"
sudo systemctl enable --now bluetooth
ok "Ending..."

action "Clone repos"
cd "$HOME"
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

action "Refresh fonts"
sudo fc-cache -fv
ok "Ending..."
