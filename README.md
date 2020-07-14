# My Vim Configuration

This is my personal Vim configuration, which is mostly managed with
[Vundle](https://github.com/gmarik/vundle/).  I like to run a fairly minimal
Vim, with just a few customizations for the languages I use regularly.

![Screenshot](http://i.imgur.com/UiaSsOw.png)

## Installation

You need at least Vim 7.3, and you'll need git installed.

### The no-brainer installation

The easy solution is to just run:

    -bash$  git clone git://github.com/d11wtq/dot-vim.git ~/.vim
    -bash$  vim -u ~/.vim/setup

This will make the needed symlinks and open Vim to finish the install.

### The manual installation

If you don't feel comfortable using a shell script, the manual
steps are simple:

First delete any ~/.vim/ directory and ~/.vimrc file you may have. Then:

    -bash$  git clone git://github.com/d11wtq/dot-vim.git ~/.vim
    -bash$  ln -s ~/.vim/vimrc ~/.vimrc
    -bash$  cd ~/.vim && git clone https://github.com/gmarik/Vundle.vim bundle/vundle

Now you can start vim.  No plugins (except Vundle) will have yet been
installed, but you just install them using Vundle from inside of Vim:

    :PluginInstall

Vundle will clone and register all the specified plugins (into ~/.vim/bundle/).

If you want the color scheme and git status line to take effect, either quit
and restart Vim, or re-source the .vimrc:

    :so ~/.vimrc

## Updating the Plugins

Vundle manages updating of plugins, via git.  Just run:

    :PluginInstall!

(With that bang! at the end)

## Disclaimer

Ummm.

:wq
