set runtimepath+=~/.vimconf

" Plugin loading
call plug#begin('~/.vimplug')
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
call plug#end()

" Vim configuration
let mapleader=','
autocmd! bufwritepost ~/.vimconf/vimrc source ~/.vimconf/vimrc

" Plugin configuration: NERDTree
map <leader>f :NERDTreeToggle<CR>
map <leader>F :NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=1

" Plugin configuration: ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
map <leader>g :Ack 
