set runtimepath+=~/.vimconf

" Plugin loading
call plug#begin('~/.vimplug')
Plug 'scrooloose/nerdtree'
call plug#end()

" Vim configuration
let mapleader=','
autocmd! bufwritepost ~/.vimconf/vimrc source ~/.vimconf/vimrc

" Plugin configuration: NERDTree
map <leader>f :NERDTreeToggle<CR>
map <leader>F :NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=1
