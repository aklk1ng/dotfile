#! /bin/bash

function get_linux_distro() {
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
    elif grep -Eq "Raspbian" /etc/*-release; then
        echo "Raspbian"
    elif grep -Eq "uos" /etc/*-release; then
        echo "UOS"
    elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
    elif grep -Eq "elementary" /etc/*-release; then
        echo "elementaryOS"
    elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
    elif grep -Eq "Kali" /etc/*-release; then
        echo "Kali"
    elif grep -Eq "Parrot" /etc/*-release; then
        echo "Parrot"
    elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
    elif grep -Eq "fedora" /etc/*-release; then
        echo "fedora"
    elif grep -Eq "openSUSE" /etc/*-release; then
        echo "openSUSE"
    elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
    elif grep -Eq "ManjaroLinux" /etc/*-release; then
        echo "ManjaroLinux"
    elif grep -Eq "alpine" /etc/*-release; then
        echo "Alpine"
    else
        echo "Unknown"
    fi
}

function install_plugin() {
    bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
    brew install zsh-vi-mode
}

# 安装mac平台必备软件
function install_prepare_software_on_mac() {
    xcode-select --install
    brew install curl
}

# 安装FreeBSD必备软件
function install_prepare_software_on_freebsd() {
    sudo pkg install -y curl
}

# 安装android平台必备软件
function install_prepare_software_on_android() {
    pkg update
    pkg install -y curl
}

# 安装alpine必备软件 需要更换源
function install_prepare_software_on_alpine() {
    sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories

    version=$(get_alpine_version)

    apk update

    apk add curl
}

# 安装ubuntu必备软件
function install_prepare_software_on_ubuntu() {
    sudo apt-get update

    sudo apt-get install -y curl
}

# 安装ubuntu系必备软件
function install_prepare_software_on_ubuntu_like() {
    sudo apt-get update
    sudo apt-get install -y curl
}

# 安装debian必备软件
function install_prepare_software_on_debian() {
    sudo apt-get update
    sudo apt-get install -y curl
}

# 安装parrot必备软件
function install_prepare_software_on_parrot() {
    sudo apt-get update
    sudo apt-get install -y curl
}

# 安装centos必备软件
function install_prepare_software_on_centos() {
    version=$(get_centos_version)
    if [ $version -ge 8 ]; then
        sudo dnf install -y curl
    else
        sudo yum install -y curl
    fi
}

# 安装fedora必备软件
function install_prepare_software_on_fedora() {
    sudo dnf install -y curl
}

# 安装archlinux必备软件
function install_prepare_software_on_archlinux() {
    sudo pacman -S curl
}

# 安装opensuse必备软件
function install_prepare_software_on_opensuse() {
    sudo zypper install -y curl
}
function begin_install_zim() {
    ps -ef | grep clash | grep -v grep
    if [ $? -ne 0 ]; then
        curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    else
        curl --proxy 127.0.0.1:7890 -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    fi
}

function is_exist_dir() {
    dir=$1
    if [ -d $dir ]; then
        echo 1
    else
        echo 0
    fi
}

function get_datetime() {
    time=$(date "+%Y%m%d%H%M%S")
    echo $time
}

function backup_old_files() {
    old_zim=$HOME"/.zim"
    old_zshrc=$HOME".zshrc"
    old_zimrc=$HOME".zimrc"
    is_exist=$(is_exist_dir $old_zim)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_zim=$old_zim"_bak_"$time
        read -p "Find "$old_zim" already exists,backup "$old_zim" to "$backup_zim"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp -r $old_zim $backup_zim
        fi
    fi
    if [[ -e old_zimrc ]]; then
        time=$(get_datetime)
        backup_zimrc=$old_zimrc"_bak_"$time
        cp $old_zimrc $backup_zimrc
    fi
    if [[ -e old_zshrc ]]; then
        time=$(get_datetime)
        backup_zshrc=$old_zshrc"_bak_"$time
        cp $old_zshrc $backup_zshrc
    fi
}
function copy_cat_files() {
    cp ./*.zsh ~/.zim/
    cat ./.zimrc >>~/.zimrc
    tp=$(uname -s)
    if [[ $tp == "Linux" ]]; then
        cat ./.zshrc >>~/.zshrc
    else
        tail -35 ./.zshrc >>~/.zshrc
    fi
}

function install_zim_on_mac() {
    backup_old_files
    install_prepare_software_on_mac
    begin_install_zim
    copy_cat_files
    install_plugin
}
function install_zim_on_freebsd() {
    backup_old_files
    install_prepare_software_on_mac
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_android() {
    backup_old_files
    install_prepare_software_on_android
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_ubuntu() {
    backup_old_files
    install_prepare_software_on_ubuntu
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_ubuntu_like() {
    backup_old_files
    install_prepare_software_on_ubuntu_like
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_debian() {
    backup_old_files
    install_prepare_software_on_debian
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_parrot() {
    backup_old_files
    install_prepare_software_on_parrot
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_centos() {
    backup_old_files
    begin_install_zim
    install_prepare_software_on_centos
    copy_cat_files
    install_plugin
}

function install_zim_on_fedora() {
    backup_old_files
    install_prepare_software_on_fedora
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_archlinux() {
    backup_old_files
    install_prepare_software_on_archlinux
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_opensuse() {
    backup_old_files
    install_prepare_software_on_archlinux
    begin_install_zim
    copy_cat_files
    install_plugin
}

function install_zim_on_alpine() {
    backup_old_files
    install_prepare_software_on_archlinux
    begin_install_zim
    copy_cat_files
    install_plugin
}
function install_zim_on_linux() {
    distro=$(get_linux_distro)
    echo "Linux distro: "${distro}

    if [ ${distro} == "Ubuntu" ]; then
        install_zim_on_ubuntu
    elif [ ${distro} == "Deepin" ]; then
        install_zim_on_ubuntu_like
    elif [ ${distro} == "LinuxMint" ]; then
        install_zim_on_ubuntu_like
    elif [ ${distro} == "elementaryOS" ]; then
        install_zim_on_ubuntu_like
    elif [ ${distro} == "Debian" ]; then
        install_zim_on_debian
    elif [ ${distro} == "Raspbian" ]; then
        install_zim_on_debian
    elif [ ${distro} == "UOS" ]; then
        install_zim_on_debian
    elif [ ${distro} == "Kali" ]; then
        install_zim_on_debian
    elif [ ${distro} == "Parrot" ]; then
        install_zim_on_parrot
    elif [ ${distro} == "CentOS" ]; then
        install_zim_on_centos
    elif [ ${distro} == "fedora" ]; then
        install_zim_on_fedora
    elif [ ${distro} == "openSUSE" ]; then
        install_zim_on_opensuse
    elif [ ${distro} == "ArchLinux" ]; then
        install_zim_on_archlinux
    elif [ ${distro} == "ManjaroLinux" ]; then
        install_zim_on_archlinux
    elif [ ${distro} == "Alpine" ]; then
        install_zim_on_alpine
    else
        echo "Not support linux distro: "${distro}
    fi
}

function install() {
    type=$(uname)
    echo "Platform type: "${type}
    if [ ${type} == "Darwin" ]; then
        install_zim_on_mac
    elif [ ${type} == "FreeBSD" ]; then
        install_zim_on_freebsd
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android"
            install_zim_on_android
        else
            install_zim_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi
    echo "zim config is well,you can excute source ~/.zshrc to update!"
}

function update() {
    cp ./*.zsh ~/.zim/
}

case "$1" in
install)
    install
    ;;
update)
    update
    ;;
*)
    echo "Please use main|update arguments"
    ;;
esac
