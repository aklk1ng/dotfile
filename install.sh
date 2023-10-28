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
sudo pacman -S git unzip lxappearance xfce4-settings grim zoxide tree-sitter \
    python-requests slurp swappy fish pamixer brightnessctl gvfs mpd mpc ncmpcpp \
    ranger tmux bat ripgrep cmake fzf lolcat npm yarn yt-dlp \
    network-manager-applet kitty lazygit wl-clipboard mupdf eza wofi glow \
    swaybg --noconfirm
bat cache --build

# git config
git config --global user.name "aklk1ng"
git config --global user.email "2628084745@qq.com"
git config --global core.editor "nvim"

echo "clone neovim config"
git clone https://github.com/aklk1ng/nvim "$HOME"/.config/nvim
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

yay -S hyprland waybar cava \
    swaylock-effects wlogout \
    xdg-desktop-portal-hyprland \
    joshuto keyd fastfetch yazi-git --noconfirm

cd $dotfile_dir

echo "linking files..."
stow chrome-flags fish kitty joshuto mpd ncmpcpp yazi wofi tmux hypr swaylock waybar cava bat gtk3 hypr-empty
echo "ending..."

echo "copy FiraCode..."
sudo cp $dotfile_dir/FiraCode -r /usr/share/fonts/
sudo fc-cache -v
echo "ending..."

echo "save fish theme"
fish_config theme save ayu\ Dark
chsh -s $(which fish)
echo "ending..."

echo "start mpd service..."
systemctl start mpd.service --user
echo "ending..."

cd $HOME
echo "clone repos"
git clone https://github.com/aklk1ng/yt-dlp.git --depth 1
git clone https://github.com/aklk1ng/scripts.git --depth 1
git clone https://github.com/aklk1ng/wallpaper.git --depth 1
git clone https://github.com/aklk1ng/keyd.git
sudo cp keyd/default.conf /etc/keyd/
systemctl enable keyd.service
systemctl start keyd.service
echo "ending..."
