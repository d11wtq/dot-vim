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

" a hybrid theme
Bundle 'w0ng/vim-hybrid'

" my own theme
Bundle 'd11wtq/subatomic256.vim'

" my other own theme
Bundle 'd11wtq/macvim256.vim'

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

" buffer management for ctrlp
Bundle 'd11wtq/ctrlp_bdelete.vim'

" clojure syntax handling
Bundle 'guns/vim-clojure-static'

" rainbow parens
Bundle 'kien/rainbow_parentheses.vim'

" paredit mode for lisps
Bundle 'vim-scripts/paredit.vim'

" maniuplate delimited things
Bundle 'tpope/vim-surround'

" llvm-as syntax handling
Bundle 'Superbil/llvm.vim'

" initialize ctrlp_bdelete
call ctrlp_bdelete#init()

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

" override tab settings for other languages
augroup tab_settings
  autocmd!
  autocmd FileType php    setlocal shiftwidth=2 tabstop=2 noexpandtab
  autocmd FileType erlang setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

" use unicode chars for invisibles (like TextMate)
set listchars=tab:▸\ ,eol:¬

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
set background=light
silent! colorscheme macvim256

" set the leader key to ';' (easy to type)
let mapleader = ";"

" Enter turns off any highlighted matches, then acts as normal
nnoremap <CR> :noh<CR><CR>

" select a block and hit C-o to open that block with spaces
vnoremap <C-o> yPgvr<Space>

" tapping space shows and hides the right margin
nnoremap <Space> :call ToggleMarginIndicator()<CR>

" tapping <tab> toggles invisibles on/off
nnoremap <Tab> :set list!<CR>

" strip all trailing whitespace in the buffer
nnoremap <Leader><Backspace> :FixWhitespace<CR>

" toggle rainbow parens
nnoremap <Leader>' :RainbowParenthesesToggle<CR>

" clojure prompt
nmap <Leader>, cqp

" bring up the buffer selection menu in ctrlp
nnoremap <C-b> :CtrlPBuffer<CR>

" clear the ctrlp cache and open ctrlp
nnoremap <C-@> :CtrlPClearAllCaches<CR>:CtrlP<CR>

" open this vimrc with ;/
nnoremap <Leader>/ :e $MYVIMRC<CR>

" highlight .sh files with bash syntax
let g:is_bash = 1

" ctrlp doesn't show dotfiles by default
let g:ctrlp_show_hidden = 1

" special clojure forms
let g:clojure_fuzzy_indent_patterns = [
      \ '^with',
      \ '^def',
      \ '^let' ]

" don't limit how far back clojure-static can search
let g:clojure_maxlines = 10000

" don't limit how far back paredit can search
let g:paredit_matchlines = 10000

augroup scheme_settings
  autocmd!
  autocmd FileType scheme silent! setlocal lispwords += define
augroup END

" show or hide the margin indicator
function! ToggleMarginIndicator()
  if &l:colorcolumn
    set colorcolumn=
  else
    set colorcolumn=80
  endif
endfunction

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
