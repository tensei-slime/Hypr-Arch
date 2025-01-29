#!/bin/bash

#
#Zsh-color-theme
# /* https://github.com/tensei-slime*/ 
#
ThemeDir="$HOME/zshThemes/"


selected=$( ls $ThemeDir | rofi -dmenu -p "Select Color-Theme")

if ls $HOME | grep .zshrc &>/dev/null; then 
  rm $HOME/.zshrc
  cp $ThemeDir/$selected $HOME/.zshrc
else
  cp $ThemeDir/$selected $HOME/.zshrc
fi
