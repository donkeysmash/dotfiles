set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on

set showcmd
set nu
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smarttab
set hlsearch

set clipboard=unnamed


syntax enable
colorscheme molokai

map <C-n> :NERDTreeToggle<CR>

set laststatus=2
let g:airline_theme='badwolf'

set ttimeoutlen=50
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.swp,*/node_modules/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_by_filename = 1
