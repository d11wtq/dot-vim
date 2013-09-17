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

" markdown syntax highlighting
Bundle 'hallison/vim-markdown'

" better tab completion
Bundle 'ervandew/supertab'

" erb support and the likes
Bundle 'tpope/vim-rails'

" molokai theme
Bundle 'tomasr/molokai'

" tomorrow theme
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" a hybrid theme
Bundle 'w0ng/vim-hybrid'

" php mode stuff
Bundle 'tobyS/vip'

" erlang mode stuff
Bundle 'jimenezrick/vimerl'

" trailing whitespace annoyances
Bundle 'bronson/vim-trailing-whitespace'

" git integration
Bundle 'tpope/vim-fugitive'

" quick open files
Bundle 'kien/ctrlp.vim'

" sublime-text style multiple cursors
Bundle 'terryma/vim-multiple-cursors'

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

" tabs are drawn as 2 spaces
set shiftwidth=2

" soft tabs are 2 spaces
set softtabstop=2

" use unicode chars for invisibles (like TextMate)
set listchars=tab:▸\ ,eol:¬

" override tab settings for php
augroup filetype_php
  autocmd!
  autocmd FileType php setlocal noexpandtab shiftwidth=2 tabstop=2
augroup END

" override tab settings for erlang
augroup filetype_erlang
  autocmd!
  autocmd FileType erlang setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

" allow syntaxes
syntax on

" always show the status line
set laststatus=2

" opening a file any buffer uses the pwd for that file
set autochdir

" instead of prompting to load changed file, just load it
set autoread

" use modeline comments to keep tab settings happy
set modeline

" check 5 lines into a file for a modeline
set modelines=5

" the escape key in a terminal lags for 1s; in practice 10ms is enough
set ttimeoutlen=10

" purdy colors
set background=dark
silent! colorscheme hybrid

" set the leader key to ';' (easy to type)
let mapleader = ";"

" Enter turns off any highlighted matches, then acts as normal
nnoremap <CR> :noh<CR><CR>

" make vim's regex interpretation friendlier (see :h pattern)
nnoremap / /\v
vnoremap / /\v

" select a block and hit C-o to open that block with spaces
vnoremap <C-o> yPgvr<Space>

" tapping space toggles invisibles on/off
nnoremap <Space> :set list!<CR>

" bring up the file selection menu in ctrlp
nnoremap <C-f> :CtrlP<CR>

" bring up the buffer selection menu in ctrlp
nnoremap <C-b> :CtrlPBuffer<CR>

" clear the ctrlp cache and open ctrlp
nnoremap <C-@> :CtrlPClearAllCaches<CR>:CtrlP<CR>

" open this vimrc with ;/
nnoremap <Leader>/ :e ~/.vimrc<CR>

" ctrlp doesn't show dotfiles by default
let g:ctrlp_show_hidden = 1

" ubuntu has some dumb sql plugin installed that breaks the arrow keys
let g:omni_sql_no_default_maps = 1

" keep track of the status bar highlight mode (optimization)
let g:bar_mode = 0

" change status line color depending on the state of the buffer
function! ColorizeStatusLine(...)
  if a:0 && a:1 == "i" && g:bar_mode != -1
    let g:bar_mode = -1
    highlight StatusLine ctermbg=15  ctermfg=9 guibg=#EF4E56  guifg=#FAFAFA
  else
    if &l:modified == g:bar_mode
      return
    else
      if &l:modified
        highlight StatusLine ctermbg=15 ctermfg=32 guibg=#0190D4  guifg=#FAFAFA
      else
        highlight StatusLine ctermbg=238 ctermfg=253 guibg=#D4D4D4  guifg=#666666
      endif

      let g:bar_mode = &l:modified
    endif
  endif
endfunction

augroup hi_statusline
  autocmd!
  autocmd InsertEnter * call ColorizeStatusLine("i")
  autocmd InsertLeave,CursorMoved,BufReadPost,BufWritePost * call ColorizeStatusLine()
augroup END

" plug fugitive into the status line
function! GitifyStatusLine()
  if exists("*fugitive#statusline")
    set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ %-14.(%l,%c%V%)\ %P
  endif
endfunction

augroup gitify_statusline
  autocmd!
  autocmd BufEnter * call GitifyStatusLine()
augroup END

" turn off the toolbar in macvim
if has("gui_running")
  set guioptions=egmrt
endif

" finally, load any further, ad-hoc customizations
silent! so ~/.vim/customrc
