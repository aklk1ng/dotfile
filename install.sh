#! /bin/bash

sudo pacman -S zsh fish mpc mpc ncmpcpp neofetch ranger rofi tmux
yay -S joshuto

echo "linking files..."
stow chrome-flags fish joshuto mpd ncmpcpp neofetch profile ranger rofi st tmux xinit Xresources 

echo "copy the fcitx5 Nord theme..."
mkdir -p ~/.local/share/fcitx5/themes/
cp -r Nord-Dark ~/.local/share/fcitx5/themes/
echo "ending..."
