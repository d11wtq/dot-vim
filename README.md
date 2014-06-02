# My Vim Configuration

This is my personal Vim configuration, which is mostly managed with
[Vundle](https://github.com/gmarik/vundle/).  I like to run a fairly minimal
Vim, with just a few customizations for the languages I use regularly.

![Screenshot](http://i.imgur.com/UiaSsOw.png)

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
  * Trailing Whitespace
    - unwanted trailing whitespace shows up in a nice ugly red
  * Erlang
    - interacts with the Erlang VM to help with Erlang development
  * Clojure
    - adds syntax support, paredit and REPL features
  * Paredit
    - automatically matches braces in lisps; allows lisps to be edited as a
      syntax tree, rather than just text
  * Rainbow Parentheses
    - shows matching parentheses in pretty colors (useful for lisps)
  * Ruby on Rails
    - provides useful features for working on Rails projects
  * Fugitive
    - allows vim to act as a frontend to git
  * Surround
    - allows inserting/modifying matching pairs (quotes, brackets) easily
  * Markdown
    - syntax highlighting for markdown files (buggy!!!)

## Custom settings

  * Map leader
    - set to `";"`
  * Indentaton
    - 2 spaces almost everywhere
    - 2 spaces for Ruby
    - 4 spaces for Erlang
    - 4 spaces for Python
    - semantically aligned for Clojure/Lisp/Scheme
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
    - <kbd>Space</kbd> toggles `colorcolumn` on/off (right margin)
    - <kbd>TAB</kbd> runs `:set list!` (toggle invisibles on/off)
    - <kbd>C-o</kbd> in visual block mode, fills the selection with spaces
    - <kbd>Leader-/</kbd> opens the ~/.vimrc
    - <kbd>Leader-Backspace</kbd> deletes trailing whitespace
    - <kbd>Leader-'</kbd> toggles rainbow-parens on/off

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

:wq
