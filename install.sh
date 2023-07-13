#! /bin/bash

sudo pacman -S zsh fish mpc mpc ncmpcpp neofetch ranger rofi tmux wofi
yay -S

yay -S --noconfirm hyprland kitty waybar \
    swaybg swaylock-effects wofi wlogout mako \
    ttf-jetbrains-mono-nerd noto-fonts-emoji \
    polkit-gnome python-requests \
    swappy grim slurp pamixer brightnessctl gvfs \
    bluez bluez-utils lxappearance xfce4-settings \
    xdg-desktop-portal-hyprland \
    joshuto waperd

echo "linking files..."
stow chrome-flags fish joshuto mpd ncmpcpp neofetch profile ranger rofi st tmux xinit Xresources hypr swaylock mako

echo "copy the fcitx5 Nord theme..."
mkdir -p ~/.local/share/fcitx5/themes/
cp -r Nord-Dark ~/.local/share/fcitx5/themes/
echo "ending..."
