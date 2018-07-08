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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'milkypostman/vim-togglelist'
Plug 'w0rp/ale'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'easymotion/vim-easymotion'
call plug#end()

" Vim configuration
let mapleader=','
autocmd! BufWritePost ~/.vimconf/vimrc source ~/.vimconf/vimrc
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
filetype plugin on
filetype indent on
syntax enable
set autoindent
set backspace=eol,start,indent
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
set updatetime=100
set wildmenu
set wildmode=longest,full
set whichwrap+=<,>,h,l
cnoreabbrev Q q
cnoreabbrev W w
map <silent> <leader>w :w !sudo tee % > /dev/null<cr>
map <silent> <leader><cr> :nohlsearch<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <silent> <leader>P :setlocal paste!<cr>
map <silent> <leader>S :setlocal spell!<cr>
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
augroup FiletypeGroup
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

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

" Plugin configuration: togglelist.vim
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" Plugin configuration: ale
let g:ale_fixers={
\ 'javascript': ['prettier', 'eslint'],
\}
let g:ale_set_signs=0
map <leader>d :ALEGoToDefinition<cr>
map <leader>p :ALEFix<cr>
