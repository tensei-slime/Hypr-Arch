#!/bin/bash

# Arch-distros only

#[This is made for myself]

cd ~/
cd Hypr-Arch/
clear
# Get the current user
USER=$(whoami)

# Copy the individual files/directories from 'config' to the current user's .config
for dir in config/*; do
  if [ -d "$dir" ]; then
    echo "Copying directory: $dir"
    cp -r "$dir" "/home/$USER/.config/"
  elif [ -f "$dir" ]; then
    echo "Copying file: $dir"
    cp "$dir" "/home/$USER/.config/"
  fi
done

# Copy Pictures and .zshrc files
cp -r Pictures /home/$USER/Pictures
cp zsh/.zshrc /home/$USER/.zshrc

# Check if yay is installed and install packages
if command -v yay &>/dev/null; then
  echo "Installing Necessary packages..."
  yay -S brave-bin code mpvpaper swaylock-effects-improved-git pywal
  clear
  sudo pacman -S --noconfirm neovim
  clear
  echo "[-] Installation Finished!"
else
  # Install yay if it's not installed
  git clone https://aur.archlinux.org/yay-git.git
  cd yay-git/
  makepkg -si
  cd ..
  clear
  echo "Installing Necessary packages..."
  yay -S brave-bin code mpvpaper swaylock-effects-improved-git pywal
  clear
  sudo pacman -S --noconfirm neovim
  clear
  echo "[-] Installation Finished!"
fi
