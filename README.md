# My Vim Configuration

This is my personal Vim configuration, which is mostly managed with
[Vundle](https://github.com/gmarik/vundle/).  I like to run a fairly minimal
Vim, with just a few customizations for Ruby and PHP development.

![Screenshot](http://i.imgur.com/OuizSk5.png)

## Plugins

Some plugins are installed, but not very many. Supertab and CtrlP are by far
the most useful.

  * Vundle
    - plugins are managed through `Bundle` lines in .vimrc
    - no need to leave Vim to install plugins
    - no need to deal with git submodules
    - easy to keep up-to-date
  * CtrlP
    - kien's ctrlp plugin provides fuzzy find in project
    - it's generally fast, though sometimes makes odd preferences
  * Supertab
    - allows for tab-completion of words in insert mode
  * Multiple Cursors
    - terryma's vim-multiple-cursors adds Sublime Text's concept to Vim
  * Trailing Whitespace
    - unwanted trailing whitespace shows up in a nice ugly red
  * Erlang
    - interacts with the Erlang VM to help with Erlang development
  * Ruby on Rails
    - provides useful features for working on Rails projects

## Custom settings

  * Map leader
    - set to `";"`, though I don't use it much
  * Indentaton
    - 2 spaces almost everywhere
    - 2 spaces for Ruby
    - 4 spaces for Erlang
    - tabs for PHP
  * Trailing whitespace
    - automatically cleaned up as you type
    - doesn't tamper with whitespace that was already there
    - forces a newline at the end of files
  * Backup files etc
    - all turned off, sorry
  * Line numbers
    - on by default
  * Mappings
    - <kbd>C-b</kbd> runs `:CtrlPBuffer`
    - <kbd>C-@</kbd> runs `:CtrlPClearAllCaches` then `:CtrlP`
    - <kbd>CR</kbd> runs `:noh` then `<CR>` (turn off search matches)
    - <kbd>Space</kbd> runs `:set list!` (toggle invisibles on/off)
    - <kbd>C-o</kbd> in visual block mode, fills the selection with spaces
    - <kbd>/</kbd> inserts a `"\v"` in the patten so the regexp is more sane
  * Status bar
    - the status bar changes color to reflect the following states:
      - normal/visual, clean: white
      - normal/visual, dirty: blue
      - insert: red

## Installation

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
