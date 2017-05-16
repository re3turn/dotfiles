set encoding=utf-8
scriptencoding utf-8

" -------------------------------
" Character code
" -------------------------------
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" -------------------------------
" autocmd group
" -------------------------------
augroup vimrc
  autocmd!
augroup END

" -------------------------------
" Tab and indent
" -------------------------------
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

" -------------------------------
" Cursor
" -------------------------------
set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
let mapleader = "\<Space>"

set backspace=indent,eol,start

" -------------------------------
" Parenthesis and tag
" -------------------------------
set showmatch

if !has('nvim')
    source $VIMRUNTIME/macros/matchit.vim
endif

" -------------------------------
" Search
" -------------------------------
set incsearch
set ignorecase
set smartcase
set hlsearch

" -------------------------------
" Command Mode
" -------------------------------
set wildmenu
set history=5000

" -------------------------------
" Paste mode
" -------------------------------
autocmd vimrc InsertLeave * set nopaste

" -------------------------------
" Etc setting
" -------------------------------
if has('mouse')
    set mouse=a
    if !has('nvim')
        set ttymouse=xterm2
    endif
endif

set clipboard=unnamed,unnamedplus

" -------------------------------
" dein
" -------------------------------
let s:dein_dir = expand('~/.cache/dein')
" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir   )
    call dein#begin(s:dein_dir)

    " TOML file
    let g:rc_dir    = expand('~/.config/nvim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " read TOML
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif

if dein#check_install()
    call dein#install()
endif

" -------------------------------
" Syntax
" -------------------------------
syntax enable
filetype plugin indent on
set background=light
colorscheme solarized
