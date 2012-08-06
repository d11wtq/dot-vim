" actually run as vim, not vi
set nocompatible

" 256-color terminal
set t_Co=256

" utf-8 by default
set encoding=utf-8

" vundle requires turning off filetypes momentarily
filetype off

" include vundle on the runpath
set rtp+=~/.vim/bundle/vundle/

" initialize vundle
call vundle#rc()

" let vundle manage itself
Bundle 'gmarik/vundle'

" ruby mode (might not be needed, w/ vim-rails?)
Bundle 'vim-ruby/vim-ruby'

" better tab completion
Bundle 'ervandew/supertab'

" erb support and the likes
Bundle 'tpope/vim-rails'

" solarized color theme
Bundle 'altercation/vim-colors-solarized'

" mustang theme
Bundle 'croaker/mustang-vim'

" php mode stuff
Bundle 'tobyS/vip'

" trailing whitespace annoyances
Bundle 'bronson/vim-trailing-whitespace'

" git integration
Bundle 'tpope/vim-fugitive'

" quick open files
Bundle 'L9'
Bundle 'FuzzyFinder'

" show current line and col in status bar
set ruler

" show filename in status bar
set title

" line numbers
set number

" let vim do more at once, with a modern terminal
set ttyfast

" always show current mode in status bar
set showmode

" tab completion done better
set wildmode=list:full

" allow opening new files while edits are kept
set hidden

" highlight matches in search
set hlsearch

" show matches while typing
set incsearch

" fuck ~backup files
set nobackup

" fuck ~backup files during editing
set nowritebackup

" fuck .swp files
set noswapfile

" force blank lines at end of file
set eol

" disallow assumption of binary (noeol) mode
set nobinary

" needed for most plugins to work
filetype plugin indent on

" spaces, not tabs
set expandtab

" not sure, will check
set shiftwidth=2

" soft tabs are 2 spaces
set softtabstop=2

" override tab settings for php
augroup filetype_php
  autocmd!
  autocmd FileType php setlocal noexpandtab shiftwidth=2 tabstop=2
augroup END

" allow syntaxes
syntax on

" always show the status line
set laststatus=2

" opening a file any buffer uses the pwd for that file
set autochdir

" instead of prompting to load changed file, just load it
set autoread

" purdy colors
set background=dark
silent! colorscheme mustang

" customize status line components to include git repo info
if exists("fugitive#statusline()")
  set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ %-14.(%l,%c%V%)\ %P
endif

" set the leader key to ';' (easy to type)
let mapleader = ";"

" C-c usually by-passes the InsertLeave event
inoremap <C-c> <ESC>

" make vim's regex interpretation friendlier (see :h pattern)
nnoremap / /\v
vnoremap / /\v

" turn highlighting back off easily
nnoremap <Leader>/ :noh<CR>
vnoremap <Leader>/ :noh<CR>

" provide shortcuts to FuzzyFinder
nnoremap <C-f> :FufFile ./<CR>
nnoremap <C-b> :FufBuffer<CR>

" Toggles between two open buffers, like :b#, but respecting closed buffers
" FIXME: Extract this to a plugin
function! BufToggle()
  if bufloaded(bufname("#")) " respect closed buffers
    execute "buffer " . bufname("#")
  else
    execute "bprev"
  endif
endfunction

" ;b toggles between two buffers
nnoremap <Leader>b :call BufToggle()<CR>

" ubuntu has some dumb sql plugin installed that breaks the arrow keys
let g:omni_sql_no_default_maps = 1

" make status line red while in insert mode
augroup hi_statusline
  autocmd!
  autocmd InsertEnter * hi StatusLine ctermbg=15  ctermfg=9
  autocmd InsertLeave * hi StatusLine ctermbg=238 ctermfg=253
augroup END

" finally, load any further, ad-hoc customizations
silent! so ~/.vim/customrc
