set runtimepath+=~/.vimconf

" Plugin loading
call plug#begin('~/.vimplug')
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
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
  let g:ackprg='ag --vimgrep'
endif
map <leader>g :Ack 

" Plugin configuration: gruvbox
colorscheme gruvbox
highlight Normal ctermbg=none

" Plugin configuration: vim-airline
let g:airline_powerline_fonts=1

" Plugin configuration: fugitive.vim
map <leader>gd :Gdiff<cr>
map <leader>gb :Gblame<cr>
