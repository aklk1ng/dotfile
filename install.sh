#! /bin/bash

dotfile_dir = "$HOME/dotfile"

cd $dotfile_dir
sudo pacman -S git unzip stow zsh lxappearance xfce4-settings grim bluez bluez-utils python-requests slurp swappy fish pamixer brightnessctl gvfs mpd mpc ncmpcpp ranger rofi tmux bat ripgrep make cmake fzf fastfetch mdcat lolcat npm yarn pamixer pactl cal yt-dlp dunst network-manager-applet copyq blueman kitty lazygit
echo "Install yay"
stow profile
cd $HOME
sudo git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si
echo "ending..."

echo "Install some packages"
yay -Syu

yay -S --noconfirm hyprland waybar swww cava \
    swaylock-effects wlogout \
    xdg-desktop-portal-hyprland \
    joshuto keyd

echo "Install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --git=https://github.com/aklk1ng/hypr-empty
echo "ending..."

cd $dotfile_dir

echo "linking files..."
stow chrome-flags fish joshuto mpd ncmpcpp ranger rofi st tmux hypr swaylock waybar dunst fastfetch cava swappy
echo "ending..."

echo "copy the fcitx5 Nord theme..."
mkdir -p ~/.local/share/fcitx5/themes/
cp -r Nord-Dark ~/.local/share/fcitx5/themes/
echo "ending..."

echo "copy fonts"
sudo cp $dotfile_dir/JetBrainsMono -r /usr/share/fonts/
sudo cp $dotfile_dir/NerdFontsSymbolsOnly -r /usr/share/fonts/
sudo fc-cache -f -v
echo "ending..."

echo "save fish theme"
fish_config theme save ayu\ Dark
chsh -s $(which fish)
echo "ending..."

echo "start mpd service"
systemctl start mpd.service --user
echo "ending..."

cd $HOME
echo "clone repos"
git clone https://github.com/aklk1ng/yt-dlp.git
git clone https://github.com/aklk1ng/script.git
git clone https://github.com/aklk1ng/wallpaper.git
git clone https://github.com/aklk1ng/keyd.git
sudo cp keyd/default.conf /etc/keyd/
sudo keyd --reload
git clone https://github.com/aklk1ng/st.git $HOME/.config
cd $HOME/.config/st
sudo make clean install
echo "ending..."
