#! /bin/bash

dotfile_dir = "$HOME/dotfile"

echo "Install yay"
sudo pacman -S git base-devel
cd ~
sudo git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si
echo "ending..."

echo "Install some packages"
sudo pacman -S zsh fish mpd mpc ncmpcpp ranger rofi tmux bat ripgrep make cmake fzf
yay -Syu

yay -S --noconfirm hyprland kitty waybar swww cava \
    swaybg swaylock-effects wlogout mako \
    noto-fonts-emoji \
    python-requests \
    swappy grim slurp pamixer brightnessctl gvfs \
    bluez bluez-utils lxappearance xfce4-settings \
    xdg-desktop-portal-hyprland \
    joshuto wpaperd lazygit
echo "ending..."

cd $dotfile_dir

echo "linking files..."
stow chrome-flags fish joshuto mpd ncmpcpp profile ranger rofi st tmux xinit Xresources hypr swaylock mako waybar wpaperd dunst fastfetch cava
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
echo "ending..."
