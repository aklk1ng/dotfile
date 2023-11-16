#! /bin/bash

# Define the environment variables
ENV_VARS=(
    'GTK_IM_MODULE=fcitx5'
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

dotfile_dir=$HOME/dotfile

cd $dotfile_dir
sudo pacman -S git unzip lxappearance ninja curl xfce4-settings grim zoxide tree-sitter \
    python-requests python-pipx slurp swappy fish pamixer brightnessctl gvfs mpd mpc ncmpcpp \
    ranger tmux lua lua-language-server bat ripgrep cmake fzf lolcat npm yarn yt-dlp \
    network-manager-applet kitty lazygit wl-clipboard mupdf eza wofi glow \
    swaybg --noconfirm
bat cache --build

# git config
git config --global user.name "aklk1ng"
git config --global user.email "2628084745@qq.com"
git config --global core.editor "nvim"
git config --global core.ui true

echo "clone neovim config"
git clone https://github.com/aklk1ng/nvim --depth 1 "$HOME"/.config/nvim
echo "ending..."

echo "Install yay"
stow profile
cd $HOME
sudo git clone https://aur.archlinux.org/yay.git
cd $HOME/yay
makepkg -si
echo "ending..."

echo "Install some packages"
yay -Syu

yay -S hyprland waybar cava rustup \
    swaylock-effects wlogout \
    xdg-desktop-portal-hyprland \
    joshuto keyd fastfetch yazi-git --noconfirm

echo "Install hypr-empty"
cargo install --git https://github.com/aklk1ng/hypr-empty.git
echo "ending..."

cd $dotfile_dir

echo "linking dotfiles"
stow chrome-flags fish kitty joshuto mpd ncmpcpp yazi wofi tmux hypr swaylock waybar cava bat gtk3 hypr-empty
echo "ending..."

echo "copy fonts"
sudo cp $dotfile_dir/FiraCode -r /usr/share/fonts/
sudo fc-cache -v
echo "ending..."

echo "save fish theme"
fish_config theme save Base16\ Default\ Dark
sudo chsh -s $(which fish)
echo "ending..."

echo "start mpd service"
systemctl start mpd.service --user
echo "ending..."

cd $HOME
echo "clone repos"
git clone https://github.com/aklk1ng/yt-dlp.git --depth 1
git clone https://github.com/aklk1ng/scripts.git --depth 1
git clone https://github.com/aklk1ng/wallpaper.git --depth 1
git clone https://github.com/aklk1ng/keyd.git --depth 1
sudo cp keyd/default.conf /etc/keyd/
systemctl enable keyd.service
systemctl start keyd.service
echo "ending..."
