# My Vim Configuration

This is my personal Vim configuration, which is mostly managed with
[Vundle](https://github.com/gmarik/vundle/).  I like to run a fairly minimal
Vim, with just a few customizations for Ruby and PHP development.

## Key Niceties

### Plugins

Some plugins are installed, but not very many. Supertab and CtrlP are by far
the most useful.

### Theme

A few are installed, but Mustang is the theme that is turned on by default.

![Mustang](http://i.stack.imgur.com/vZXfV.png)

### Mappings

The leader key is ";". In practice I don't use leader commands much.

**Ctrl-C**

In normal mode, Ctrl-C clears any highlighted searches, if any are displayed,
before actually executing the usual Ctrl-C (i.e. it's overloaded, not masked).

In insert mode, Ctrl-C acts like the Escape key. In some terminals Vim waits
a second or so when pressing Escape. Using Ctrl-C has an instant effect.

**Ctrl-O (Visual Block)**

When in Visual Block mode, hitting Ctrl-O "opens" the selected region. This
is useful for indenting columns in the middle of a document. It works just
like Emacs `open-rectangle`.

![Before](http://i.stack.imgur.com/LywJK.png)
![After](http://i.stack.imgur.com/wxi2x.png)

**Ctrl-B**

Pressing Ctrl-B opens CtrlP in buffer list mode. This is the same as pressing
Ctrl-P then Ctrl-B.

**Ctrl-@**

Pressing Ctrl-@ (Ctrl-Shift-2) clears CtrlP's cache and opens CtrlP.

### Backup files

All backup/swap files are turned off. Be warned.

### Status bar

When in insert mode the status bar is turned orange. When in normal mode, it
is just white. I'd love to also have it turn yellow or green if the current
buffer is changed (i.e. marked with a "[+]").

![Insert Mode](http://i.stack.imgur.com/davKX.png)
![Normal Mode](http://i.stack.imgur.com/Ua8T6.png)

## Installation Instructions

You need at least Vim 7.2, and you'll need git installed.

### The no-brainer installation

The easy solution is to just run:

    -bash$  git clone git://github.com/d11wtq/dot-vim.git ~/.vim
    -bash$  ~/.vim/install.sh

This will make the needed symlinks and briefly open and close vim to install
the plugins. Don't worry if Vim looks all messed up when the script opens it;
it's just running the `:BundleInstall` command and then going to exit anyway.

### The manual installation

However, if you don't feel comfortable using a shell script, the manual
steps are simple:

First delete any /.vim/ directory and ~/.vimrc file you may have. Then:

    -bash$  git clone git://github.com/d11wtq/dot-vim.git ~/.vim
    -bash$  ln -s ~/.vim/vimrc ~/.vimrc
    -bash$  cd ~/.vim && git submodule update --init

Now you can start vim.  No plugins (except Vundle) will have yet been
installed, but you just install them using Vundle from inside of Vim:

    :BundleInstall

Vundle will clone and register all the specified plugins (into ~/.vim/bundle/).

If you want the color scheme and git status line to take effect, either quit
and restart Vim, or re-source the .vimrc:

    :so ~/.vimrc

## Updating the Plugins

Vundle manages updating of plugins, via git.  Just run:

    :BundleInstall!

(With that bang! at the end)

## Disclaimer

Ummm.

