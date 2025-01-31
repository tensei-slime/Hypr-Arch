#!/bin/bash

# Arch-distros only

#[This is made for myself]

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

# Move Pictures and .zshrc files
mv Pictures /home/$USER/
mv zsh/.zshrc /home/$USER/
mv Videos /home/$USER/

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
