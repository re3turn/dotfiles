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
if system('uname -r | grep WSL') != ''
    if !has('nvim')
        let g:clipboard = {
        \   'name': 'win32yankClipboard',
        \   'copy': {
        \      '+': 'win32yank -i --crlf',
        \      '*': 'win32yank -i',
        \    },
        \   'paste': {
        \      '+': 'win32yank -o --lf',
        \      '*': 'win32yank -o',
        \   },
        \   'cache_enabled': 1,
        \ }
    else
        augroup Yank
            au!
            autocmd TextYankPost * :call system('win32yank -i', @")
        augroup END
        noremap <silent> p :call setreg('"',system('win32yank -o'))<CR>""p
    endif
endif

source ~/.vim/conf/dein.vim

" -------------------------------
" Syntax
" -------------------------------
set termguicolors
syntax enable
filetype plugin indent on
set background=light
colorscheme solarized

if &shell =~# 'fish$'
    set shell=sh
endif
