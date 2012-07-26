# My Vim Configuration

This is my personal Vim configuration, which is mostly managed with
[Vundle](https://github.com/gmarik/vundle/).  I like to run a fairly minimal
Vim, with just a few customizations for Ruby and PHP development.

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

## Further customizations

If you don't intend to keep updating this configuration from my own git repo,
you can just hack on the .vimrc that you symlinked. If you want to
periodically `git pull` and get any changes I make, it is best to avoid editing
the same .vimrc directly, however.

This configuration also looks at ~/.vim/customrc, if it exists.  You can add
your own settings here.  It is loaded after ~/.vimrc, so you may override my
settings too.

## Disclaimer

Ummm.

