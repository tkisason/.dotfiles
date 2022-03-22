#!/bin/bash

if (($EUID != 0)); then
  echo >&2 "You need to run this with sudo!"
  exit 1
fi

apt update
apt full-upgrade -y
apt install -y vim tmux secure-delete terminator i3 rofi xss-lock docker.io xclip scrot
timedatectl set-timezone Europe/Zagreb
apt autoremove -y
