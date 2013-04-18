#!/bin/bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

for file in gitconfig gitignore hushlogin tmux.conf vimrc zshrc
do
  ln -s $HOME/dotfiles/$file $HOME/.$file
done

