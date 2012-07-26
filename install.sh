#!/bin/sh

if [ -e "$HOME/.vimrc" ]
then
  echo "Making backup of existing ~/.vimrc -> ~/.vimrc-old"
  mv ~/.vimrc ~/.vimrc-old
fi

echo "Symlinking ~/.vim/vimrc -> ~/.vimrc"
ln -s ~/.vim/vimrc ~/.vimrc

echo "Initializing Vundle"
cd ~/.vim
git submodule init
git submodule update

cd -

echo "Almost Done!! Just open vim and run :BundleInstall"

