#!/bin/bash

if (($EUID != 0)); then
  echo >&2 "You need to run this with sudo!"
  exit 1
fi

#install
apt update
apt full-upgrade -y
apt install -y git vim tmux secure-delete terminator i3 rofi xss-lock docker.io xclip scrot

#tweak
timedatectl set-timezone Europe/Zagreb
echo 'blacklist pcspkr' > /etc/modprobe.d/pcspkr-blacklist.conf


# cleanup
apt autoremove -y
