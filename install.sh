#! /bin/bash

dotfile_dir=$HOME/dotfile

cd $dotfile_dir
sudo pacman -S unzip lxappearance xfce4-settings grim zoxide tree-sitter \
    python-requests slurp swappy fish pamixer brightnessctl gvfs mpd mpc ncmpcpp \
    ranger tmux bat ripgrep cmake fzf lolcat npm yarn pamixer yt-dlp \
    network-manager-applet kitty lazygit wl-clipboard mupdf eza wofi glow \
    swaybg
bat cache --build
echo "Install yay"
stow profile
cd $HOME
sudo git clone https://aur.archlinux.org/yay.git
cd $HOME/yay
makepkg -si
echo "ending..."

echo "Install some packages"
yay -Syu

yay -S --noconfirm hyprland waybar cava \
    swaylock-effects wlogout \
    xdg-desktop-portal-hyprland \
    joshuto keyd fastfetch yazi-git

echo "Install rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "ending..."

cd $dotfile_dir

echo "linking files..."
stow chrome-flags fish kitty joshuto mpd ncmpcpp yazi wofi tmux hypr swaylock waybar cava bat gtk3 hypr-empty
echo "ending..."

echo "copy fonts"
sudo cp $dotfile_dir/FiraCode -r /usr/share/fonts/
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
git clone --depth 1https://github.com/aklk1ng/yt-dlp.git
git clone https://github.com/aklk1ng/scripts.git
git clone --depth 1 https://github.com/aklk1ng/wallpaper.git
git clone https://github.com/aklk1ng/keyd.git
sudo cp keyd/default.conf /etc/keyd/
systemctl enable keyd.service
systemctl start keyd.service

cd $HOME/.config/st
sudo make clean install
echo "ending..."
