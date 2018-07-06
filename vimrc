set runtimepath+=~/.vimconf

" Plugin loading
call plug#begin('~/.vimplug')
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
call plug#end()

" Vim configuration
let mapleader=','
autocmd! bufwritepost ~/.vimconf/vimrc source ~/.vimconf/vimrc
filetype plugin on
filetype indent on
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set number
set scrolloff=5
cnoreabbrev W w
map <leader>w :w !sudo tee % > /dev/null<cr>

" Plugin configuration: NERDTree
map <leader>f :NERDTreeToggle<CR>
map <leader>F :NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=1

" Plugin configuration: ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
map <leader>g :Ack 
