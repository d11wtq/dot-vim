# My Vim Configuration

This is my personal Vim configuration, which is mostly managed with
[Vundle](https://github.com/gmarik/vundle/).  I like to run a fairly minimal
Vim, with just a few customizations for Ruby and PHP development.

## All of the things

### Plugins

Some plugins are installed, but not very many. Supertab and CtrlP are by far
the most useful.

### Color Theme

Mustang is the theme that is turned on by default. It doesn't over-use color,
has good contrast and is easy on the eyes.

![Mustang](http://i.imgur.com/a2moY.png)

### Mappings

The leader key is `";"`. In practice I don't use leader mappings much.

**Enter**

In normal mode, clears any highlighted searches, if any are displayed, before
actually sending Enter (i.e. it's overloaded, not masked).

**Ctrl-O (Visual Block)**

When in Visual Block mode, hitting Ctrl-O "opens" the selected region. This
is useful for indenting columns in the middle of a document. It works just
like Emacs `open-rectangle`.

<img src="http://i.stack.imgur.com/LywJK.png" alt="Before" valign="middle" />
&nbsp;&nbsp; ⇉ ⇉ &nbsp;&nbsp;
<img src="http://i.stack.imgur.com/wxi2x.png" alt="After" valign="middle" />

**Ctrl-B**

Pressing Ctrl-B opens CtrlP in buffer list mode. This is the same as pressing
Ctrl-P then Ctrl-B.

**Ctrl-@**

Pressing Ctrl-@ (Ctrl-Shift-2) clears CtrlP's cache and opens CtrlP.

### Backup files

All backup/swap files are turned off. Be warned.

### Escape key delay (in terminals)

In most terminals the Escape key normally delays for a second or so because
some special sequence begin with the Escape key. This is reduced to 10ms,
which makes it invisible in Vim.

### Status bar

The status bar changes color according to the state of the buffer.

In insert mode it turns orange.

![Insert Mode](http://i.imgur.com/yU66I.png)

In normal & visual modes, if there are changes it turns blue.

![Modified Buffer](http://i.imgur.com/NPCaj.png)

Normally it's just grey.

![Normal Mode](http://i.imgur.com/Pvs3l.png)

## Installation Instructions

You need at least Vim 7.2, and you'll need git installed.

### The no-brainer installation

The easy solution is to just run:

    -bash$  git clone git://github.com/d11wtq/dot-vim.git ~/.vim
    -bash$  ~/.vim/install.sh

This will make the needed symlinks and open Vim with further instructions.

### The manual installation

If you don't feel comfortable using a shell script, the manual
steps are simple:

First delete any ~/.vim/ directory and ~/.vimrc file you may have. Then:

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

