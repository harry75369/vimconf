set runtimepath+=~/.vimconf

" Plugin loading
call plug#begin('~/.vimconf/vimplug')
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
syntax enable
set autoindent
set expandtab
set fileformats=unix,dos,mac
set hlsearch
set incsearch
set ignorecase
set lazyredraw
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set matchtime=2
set mouse=n
set noerrorbells
set novisualbell
set nobackup
set noswapfile
set nowritebackup
set number
set scrolloff=5
set shiftwidth=2
set showbreak=>>>
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=2
set t_vb=
set undodir=~/.vimconf/vimundo
set undofile
set whichwrap+=<,>,h,l
cnoreabbrev W w
map <silent> <leader>w :w !sudo tee % > /dev/null<cr>
map <silent> <leader><cr> :nohlsearch<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <silent> <leader>p :setlocal paste!<cr>
map <silent> <leader>s :setlocal spell!<cr>
func! DeleteTrailingWS()
  if exists('b:noDeleteTrailingWS')
    return
  endif
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
autocmd FileType vim let b:noDeleteTrailingWS=1

" Plugin configuration: NERDTree
map <leader>f :NERDTreeToggle<CR>
map <leader>F :NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=1

" Plugin configuration: ack.vim
if executable('ag')
  let g:ackprg='ag --vimgrep'
endif
map <leader>g :Ack 
map <leader>n :cn<cr>
map <leader>N :cp<cr>

" Plugin configuration: gruvbox
colorscheme gruvbox
highlight Normal ctermbg=none

" Plugin configuration: vim-airline
let g:airline_powerline_fonts=1

" Plugin configuration: fugitive.vim
map <leader>gd :Gdiff<cr>
map <leader>gb :Gblame<cr>
