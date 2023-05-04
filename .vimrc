" WSL yank support
" change this path according to your mount point
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip) 
    augroup WSLYank 
        autocmd! 
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif 
    augroup END
endif

" Primeagen's .vimrc
syntax on

set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set background=dark

