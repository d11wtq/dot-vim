# My Vim Configuration

This is my personal Vim configuration, which is mostly managed with
[Vundle](https://github.com/gmarik/vundle/).  I like to run a fairly minimal
Vim, with just a few customizations for Ruby and PHP development.

## Installation Instructions

You need at least Vim 7.2, and you'll need git installed.

First delete any /.vim/ directory and ~/.vimrc file you may have. Then:

    -bash$  git clone git://github.com/d11wtq/dot-vim.git ~/.vim
    -bash$  ln -s ~/.vim/vimrc ~/.vimrc
    -bash$  cd ~/.vim && git submodule update --init

Now you can start vim.  No plugins will have yet been installed, so you'll
get some errors, but just ignore them and type:

    :BundleInstall

Vundle will clone and register all the needed plugins.  A quick restart and
you're good to go!

## Updating the Plugins

Vundle manages updating of plugins.  Just run:

    :VundleInstall!

(With that bang! at the end)

