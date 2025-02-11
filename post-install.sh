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

for file in Pictures/wallpapers/*; do
  if [ -f "$file" ]; then
    echo "Copying wallpapers..."
    cp -r "$file" "/home/$USER/Pictures/wallpapers"
  fi
done

for video in Video/wallpapers/*; do
  if [ -d "$video" ]; then
    echo "Copying video_live_wallpapers..."
    cp -r "$video" "/home/$USER/Videos/wallpapers"
  fi
done
echo "moving .zshrc"
mv zsh/.zshrc /home/$USER/.zshrc

# Check if yay is installed and install packages
if command -v yay &>/dev/null; then
  echo "Installing Necessary packages..."
  yay -S mpvpaper swaylock-effects-improved-git pywal
  sudo pacman -S --noconfirm neovim firefox
  clear
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  echo "[-] Installation Finished! now please type 'nvim' and wait till everything is installed and write ':q' to quit !"
else
  # Install yay if it's not installed
  git clone https://aur.archlinux.org/yay-git.git
  cd yay-git/
  makepkg -si
  cd ..
  clear
  echo "Installing Necessary packages..."
  yay -S mpvpaper swaylock-effects-improved-git pywal
  sudo pacman -S --noconfirm neovim firefox
  clear
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  echo "[-] Installation Finished! now please type 'nvim' and wait till everything is installed and write ':q' to quit ! "
fi
