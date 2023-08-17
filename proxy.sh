#! /bin/bash

clash_dir=$HOME/clash

sudo pacman -S wget clash

git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890
git config --global http.postBuffer 524288000
git config --global https.postBuffer 524288000

export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5:://127.0.0.1:7890
npm config set proxy=http://127.0.0.1:7890

mkdir -p $clash_dir
cd $clash_dir
wget -O ikuuu.yaml "https://api.sub-300.club/link/qNyzHQgpZMnoEg1M?clash=3"

clash -f ikuuu.yaml -d .
