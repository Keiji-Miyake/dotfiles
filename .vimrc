" -----------------------------------------------------------------------------
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backupdir=~/.vim/backup
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" -----------------------------------------------------------------------------
" My settings
" -----------------------------------------------------------------------------

" Color settings
" -----------------------------------------------------------------------------

colorscheme darkblue

" This needs to come last, otherwise the colors aren't correct.
syntax enable

filetype plugin indent on

" SET
set encoding=utf-8
set number
set nowrap

set ignorecase
set smartcase

set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲

set ruler
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab
set clipboard=unnamedplus

" swpファイルの出力先
set directory=~/.vim/swp

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

" その他のカスタム設定を以下に書く
