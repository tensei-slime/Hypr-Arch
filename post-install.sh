#!/bin/bash

# Arch-distros only

#[This is made for myself]

cd ~/
cd Hypr-Arch/
clear
echo "[-] UserName Must be shinigami"
echo "Checking available users"

if id "shinigami" &>/dev/null; then
  echo "User found"

  # Copy directories and files
  mv config /home/shinigami/.config
  mv Pictures /home/shinigami/Pictures
  mv zsh/.zshrc /home/shinigami/.zshrc

else
  echo "[-] User shinigami not found!"
  echo "[-] Please make another user named 'shinigami'."
  echo "If you want to cancel making another user, press [Ctrl + C]."
  echo "Wait 5 seconds to continue..."

  sleep 5
  clear
  echo "[-] executing: sudo useradd -m -G wheel -s /bin/zsh shinigami"

  sudo useradd -m -G wheel -s /bin/zsh shinigami
  echo "Enter passord for Shinigami"
  passwd shinigami
  
  clear

  # Copy directories and files
  mv config /home/shinigami/.config
  mv Pictures /home/shinigami/Pictures
  mv zsh/.zshrc /home/shinigami/.zshrc
fi

if command -v yay &>/dev/null; then
  echo "Installing Necessary"
  yay -S brave-bin code mpvpaper swaylock-effects-improved-git pywal
  clear
  sudo pacman -S --noconfirm neovim
  clear
  echo "[-] Installation Finished !"

else
  git clone https://aur.archlinux.org/yay-git.git
  cd yay-git/
  makepkg si
  clear
  echo "[-] Installing Necessary"
  yay -S brave-bin code mpvpaper swaylock-effects-improved-git pywal
  clear
  sudo pacman -S --noconfirm neovim
  clear
  echo "[-] Installation Finished !"
fi
