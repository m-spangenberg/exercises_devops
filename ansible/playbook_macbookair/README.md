# Macbook Air (Early 2014) Arch-Config Playbook

<screenshots>
<screenshots>
<screenshots>

## Summary

An ansible playbook to get my Macbook Air from a minimal Arch Linux install to a working desktop.

## Dependencies

- qtile, ly, feh, alacritty, spaceship, picom, dunst, git, python3, pip, psutils

## Extra Packages

- nautilus, gvfs, bash-completion, btop, scrot, vlc, text-editor, neovim, vscodium, cmus, paru , rust, go, node, npm, yarn, pipenv

## Instructions

My install script is for a fresh install of Arch.
It's fairly simple and only performs the following steps:

- Checks for system updates and upgrades the system
- Installs all dependencies and extra software
- Manages the copying of dotfiles to where they're needed
- Downloads and sets a GTK theme, fonts and icons
- Sets Dracula colours for some applications
- Prompts you to restart the system

You can clone this repo and run it, like so:

note to self:
https://github.com/pigmonkey/spark/blob/master/group_vars/all
https://github.com/pigmonkey/spark/tree/master/roles/microcode/meta
https://wiki.archlinux.org/title/Ansible

# update system
sudo pacman -Syu

# dotfile manager
sudo pacman -S stow

# wireless drivers
pacman -S brcmfmac linux-headers
wpa_supplicant -B -i interface -c /etc/wpa_supplicant/wpa_supplicant.conf 

# window manager and compositor
pacman -S picom qtile

# download and install display manager
cd ~/Downloads
git clone --recurse-submodules https://github.com/nullgemm/ly

# download and install paru package manager
sudo pacman -S --needed base-devel
cd ~/Downloads
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si

# notification system
pacman -S dunst

# fonts
pacman -S ttf-ibm-plex gnu-free-fonts ttf-anonymous-pro

# development tools
pacman -S git openssh nodejs python3-pip pip python-pipenv python-jedi python-flake8-black go rustup npm yarn

# console tools
pacman -S allacrity starship neovim vim btop youtube-dl mc feh neofetch wget curl imagemagick pulsemixer borg rsync rclone restic

# gui tools
pacman -S gnome-notes gvfs nautilus

# media
pacman -S ffmpeg mpv vlc

# make common home folders
cd ~/ && mkdir Documents Downloads Pictures Videos Music Projects

# make wallpaper folder in Pictures folder
mkdir -p ~/Pictures/Wallpapers

# download random image to wallpaper folder
wget -q -O ~/Pictures/Wallpapers/unsplash_wallpaper.jpg https://unsplash.it/1920/1080/?random

# set wallpaper
feh --bg-scale ~/Pictures/Wallpapers/unsplash_wallpaper.jpg

# config paths
# https://wiki.archlinux.org/title/Alacritty
# https://github.com/jwilm/alacritty
allacrity - a simple, GPU-accelerated terminal emulator written in Rust.


bash - (Bourne-again Shell) is a command-line shell/programming language by the GNU Project.
https://wiki.archlinux.org/title/Bash

btop - a rewrite of bpytop in C++


dunst - a lightweight notification-daemon
https://wiki.archlinux.org/title/Dunst

feh - a lightweight and powerful image viewer and desktop wallpaper setter
https://wiki.archlinux.org/title/Feh

mc - a two-pane file manager for the command line
https://wiki.archlinux.org/title/Midnight_Commander
https://midnight-commander.org/

mpv
neofetch
nvim
picom
pipewire
profile
qtile
starship

tmux - a BSD licensed terminal multiplexer.
https://wiki.archlinux.org/title/Tmux
https://tmux.github.io/

vim
X11
youtube-dl

vim .config/neofetch/config.conf 
systemctl disable lightdm.service
vim .xinitrc 
vim /etc/ly/config.ini 
cat .Xauthority 
vim .xprofile
cp /etc/xdg/picom.conf .config/
vim .config/picom.conf 
vim .config/qtile/config.py 
mkdir .config/alacritty
cp /usr/share/doc/alacritty/example/alacritty.yml .config/alacritty/
ls -la .config/alacritty/alacritty.yml 
vim .config/alacritty/alacritty.yml 
df -hT
df -hT
lsblk
sudo pacman -S 
exit
ssh-keygen 
vim .config/qtile/config.py 
vim .config/qtile/config.py 
vim .config/qtile/config.py 
vim .config/qtile/config.py 
mkdir .config/nvim
touch .config/nvim/init.vim
vim .config/nvim/init.vim 
cd .config/nvim/plugged/vim-hexokinase/
make hexokinase
vim .config/nvim/init.vim 
touch ~/.config/starship.toml
vim .config/starship.toml 
youtube-dl 
youtube-dl -h
mkdir .config/youtube-dl
touch .config/youtube-dl/config
vim .config/youtube-dl/config
vim .config/youtube-dl/config
mkdir .config/dunst
touch .config/dunst/dunstrc
cp /etc/dunst/dunstrc .config/dunst/dunstrc
vim .config/dunst/dunstrc 
vim .config/mpv/mpv.conf
vim .config/mpv/input.conf
ls .config/mpv/
ls -la .config/qtile/
touch .config/qtile/autostart.s
ls -la .config/qtile/
cd .config/qtile/
vim autostart.sh 
vim .config/dunst/dunstrc 
usr/bin/dunst
ls /usr/bin/dunst
/usr/bin/dunst
vim .config/starship.toml 
sudo pacman -S  
vim .config/starship.toml 
vim .config/starship.toml 
cd .config/qtile/
vim .config/starship.toml 
cd .config/qtile/
paru nerd-fonts-fira-code
vim .config/picom.conf 
vim .config/picom.conf 
vim .config/qtile/config.py 
vim .config/picom.conf 
vim .config/qtile/config.py 
vim .xinitrc 
touch .Xresources
vim .Xresources 
vim .config/alacritty/alacritty.yml 
cd /usr/local/share/
vim .config/starship.toml 
cp /usr/share/pipewire/pipewire.conf .config/pipewire/
mkdir .config/pipewire
cp /usr/share/pipewire/pipewire.conf .config/pipewire/
vim .config/pipewire/pipewire.conf 
vim .config/qtile/config.py 
ip a
ping -c 3 192.168.180.1
sudo pip3 install psutil
pip install black
vim .config/qtile/config.py 
python .config/qtile/config.py 
nvim .config/nvim/init.vim 
ls -la .config/
cd .config/qtile/
vim .config/picom.conf 

# download dracula themes
mkdir -p ~/Downloads/Dracula

# btrfs on dietpi
sudo apt install btrfs-progs btrfs-tools
sudo apt install btrfs-progs
sudo apt install btrfs-progs duperemover
sudo apt install btrfs-progs duperemove
sudo mkfs.btrfs -L node2ssd /dev/sda1
sudo btrfs filesystem show /dev/sda
sudo btrfs filesystem show /dev/sda1
sudo nano /etc/fstab 
sudo umount -a
sudo mkdir /mnt/storage
sudo umount -a
sudo mount /dev/sda /mnt/storage
sudo mount -t btrfs /dev/sda /mnt/storage
sudo mount -t btrfs /dev/sda1 /mnt/storage

sudo apt install man vim btop tmux rsync git neofetch bash-completion tty-clock cmatrix figlet mc iputils-tracepath
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/dracula/tty.git
cat tty/dracula-tty.sh 
vim .bashrc 
source .bashrc 
lsblk
mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula
cd
ls -la
vim .vimrc
vim
vim .vimrc
lsblk
sudo reboot
exit
tmux source .tmux.conf 

vim .vimrc 
vifm
tmux
neofetch 
vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
vim .tmux.conf
tmux source .tmux.conf 
tmux
vim .tmux.conf
tmux
ls -la
vim .tmux.conf 
sudo reboot
exit
vim .tmux.conf 
exit
journalctl -h
journalctl
sudo journalctl
tmux
source .tmux.conf 
vim .tmux.conf 
rm .tmux.conf.swp 
ls .tmux/plugins/tpm/ 
vim .tmux.conf 

vim .bashrc 
git clone https://github.com/dracula/starship.git
cd starship/
vim .config/starship.toml
sudo vim /etc/fstab 
sudo mount -a
sudo vim .tmux.conf 

mkdir dracula
mv starship dracula/
mv tty dracula/

git clone https://github.com/dracula/midnight-commander.git
mkdir -p ~/.local/share/mc/skins && cd ~/.local/share/mc/skins
ln -s ~/dracula/midnight-commander/skins/dracula.ini
ln -s ~/dracula/midnight-commander/skins/dracula256.ini

vim .config/mc/ini
vim /etc/ssh/sshd_config
sudo vim /etc/ssh/sshd_config