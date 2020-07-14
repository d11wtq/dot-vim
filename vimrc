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
Plugin 'gmarik/vundle'

" html5 support
Plugin 'othree/html5.vim'

" ruby mode (might not be needed, w/ vim-rails?)
Plugin 'vim-ruby/vim-ruby'

" markdown syntax highlighting
Plugin 'plasticboy/vim-markdown'

" better tab completion
Plugin 'ervandew/supertab'

" erb support and the likes
Plugin 'tpope/vim-rails'

" gruvbox theme
Plugin 'morhetz/gruvbox'

" seoul color scheme
Plugin 'junegunn/seoul256.vim'

" iceberg theme
Plugin 'cocopon/iceberg.vim'

" onedark theme
Plugin 'joshdick/onedark.vim'

" erlang mode stuff
Plugin 'jimenezrick/vimerl'

" trailing whitespace annoyances
Plugin 'bronson/vim-trailing-whitespace'

" git integration
Plugin 'tpope/vim-fugitive'

" fzf basic integration
Plugin 'junegunn/fzf'

" fzf enhanced integration
Plugin 'junegunn/fzf.vim'

" clojure syntax handling
Plugin 'guns/vim-clojure-static'

" rainbow parens
Plugin 'losingkeys/vim-niji'

" paredit mode for lisps
Plugin 'vim-scripts/paredit.vim'

" maniuplate delimited things
Plugin 'tpope/vim-surround'

" scratch buffer helper
Plugin 'vim-scripts/scratch.vim'

" golang syntax
Plugin 'fatih/vim-go'

" javascript syntax support
Plugin 'pangloss/vim-javascript'

" jsx syntax
Plugin 'MaxMEllon/vim-jsx-pretty'

" replace regions with g=, g:
Plugin 'tommcdo/vim-express'

" graphql syntax
Plugin 'jparise/vim-graphql'

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

" make backspace behave itself
set backspace=2

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

" bring up the buffer selection menu in fzf
nnoremap <C-b> :Buffers<CR>

" open fzf with the files list
nnoremap <C-p> :GFiles<CR>

" open this vimrc with ;/
nnoremap <Leader>/ :e $MYVIMRC<CR>

" don't limit how far back paredit can search
let g:paredit_matchlines = 10000

" don't fold markdown on open
let g:vim_markdown_folding_disabled = 1

" purdy colors
let g:gruvbox_italic = 0
let g:gruvbox_contrast_light = 'hard'

set background=light
silent! colorscheme gruvbox

" show or hide the margin indicator
function! ToggleMarginIndicator()
  if &colorcolumn
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
