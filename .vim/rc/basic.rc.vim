set nocompatible

" cannot use powerline when ambiwidth is double
set ambiwidth=single

" not use space
set noexpandtab

" tab =- 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=0

set autoindent

" show brackets
set showmatch

" search setting
set ignorecase
set smartcase
set nowrapscan
set hlsearch
if has('nvim')
	set inccommand=split
endif

" cursor setting
set ruler

set showmode

set incsearch

set laststatus=2

" not auto generate backup file
set nobk

set backspace=2

set cindent

" can incement alphabet
set nf=alpha

" make vim's file complement the same as bash
set wildmode=list:longest:full

set list lcs=tab:\|\ 

" use 256 colors in screen
set t_Co=256

" use mouse
set mouse=a

" not wrap line
set nowrap

" show line number
set number

" for else if indent
set cinoptions=(0

" fold setting
set foldmethod=marker
set foldlevel=0

" auto judge encoding
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,sjis,utf-16le

" disable auto newline
set textwidth=0

" specify tag file (with recurcive)
set tags=.vimtags;

" disable auto comment out
set formatoptions-=ro

set display=lastline

" modeline setting
set modeline
set modelines=3

" set current directory to open file's directory
set autochdir

set sh=zsh

" enable change baffer when unsaved
set hidden
if has('nvim')
       set inccommand=split
endif

" quiet when grep result has 2 lines
set cmdheight=2

" quickrun setting
set splitright
set splitbelow

" share clipboard with os
set clipboard+=unnamedplus

