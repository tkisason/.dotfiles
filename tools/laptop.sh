#!/usr/bin/bash


apt update
apt upgrade -y
apt autoremove -y
apt install -y zsh vim tmux curl wget nmap whois jq git unzip ripgrep fd-find byobu htop p7zip-full bc secure-delete rfkill dcfldd
apt install -y proxychains tcpdump tshark smbclient socat samba-common-bin ldap-utils nbtscan netdiscover tsocks rtorrent speedtest-cli
apt install -y wireguard openvpn
apt install -y docker.io

# desktop stuff
apt install -y i3 rofi xss-lock tlp
apt install -y xinit xfce4-settings xfce4-volumed thunar gvfs-bin i3blocks
apt install -y firefox thunderbird terminator
apt install -y blackbird-gtk-theme fonts-noto-color-emoji yaru-theme-gtk yaru-theme-icon fonts-firacode ubuntu-restricted-extras
apt install -y arandr evince ristretto network-manager keepassxc redshift-gtk caffeine pavucontrol pamix bluez pulseaudio-module-bluetooth
apt install -y imagemagick xclip scrot
# we got geoip configs for redshift and don't want a geoip service and crap
apt remove -y --purge geoclue-2.0
# add yubikey specific stuff just to be sure
apt install -y gnupg2 gnupg-agent dirmngr cryptsetup scdaemon pcscd secure-delete hopenpgp-tools u2f-host

# let's make this laptop
apt -y purge cloud-init cloud-guest-utils cloud-initramfs-copymods cloud-initramfs-dyn-netconf
systemctl disable iscsid.service
systemctl disable open-iscsi.service
echo 'ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"' >> /etc/udev/rules.d/backlight.rules
echo 'ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"' >> /etc/udev/rules.d/backlight.rules
usermod -aG video `logname`
usermod -aG dialout `logname`
echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf
sysctl -p
sudo timedatectl set-timezone Europe/Zagreb
apt autoremove -y
echo "[!] Reboot machine for group changes"
