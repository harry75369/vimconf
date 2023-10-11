set runtimepath+=~/.vimconf

" Plugin loading
call plug#begin('~/.vimconf/vimplug')
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab' " Fall-back completion solution
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
Plug 'peitalin/vim-jsx-typescript'
Plug 'kchmck/vim-coffee-script'
Plug 'easymotion/vim-easymotion'
Plug 'harry75369/tagbar'
Plug 'vim-scripts/a.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'harry75369/grayout.vim'
Plug 'rust-lang/rust.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'pseewald/vim-anyfold'
Plug 'junegunn/vim-easy-align'
call plug#end()

" Vim configuration
let mapleader=','
autocmd! BufWritePost ~/.vimconf/vimrc source ~/.vimconf/vimrc
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
filetype plugin on
filetype indent on
syntax enable
set fileencodings=ucs-bom,utf-8,chinese,japanese,default,latin1
set autoindent
set backspace=eol,start,indent
set cursorcolumn
set expandtab
set fileformats=unix,dos,mac
set hlsearch
set incsearch
set ignorecase
set lazyredraw
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set matchtime=2
set mouse=a
set noerrorbells
set novisualbell
set nobackup
set noswapfile
"set nowrap
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
set ttymouse=xterm2
set t_vb=
set t_Cs=
set undodir=~/.vimconf/vimundo
set undofile
set updatetime=100
set wildmenu
set wildmode=longest,full
set whichwrap+=<,>,h,l
set matchpairs+=<:>
cnoreabbrev Q q!
cnoreabbrev W w
map <silent> <leader>w :set wrap!<cr>
map <silent> <leader>W :w !sudo tee % > /dev/null<cr>
map <silent> <leader><cr> :nohlsearch<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <silent> <leader>m :only<cr>
map <silent> <leader>c :close<cr>
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
"autocmd FileType cpp set foldmethod=syntax " this will cause vim very slow!
autocmd FileType json set foldmethod=syntax
augroup FiletypeGroup
  autocmd!
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd BufNewFile,BufRead *.vue set filetype=javascript.vue
  autocmd BufNewFile,BufRead *.json set filetype=javascript.json
augroup END
" Turn on 24-bit colors if available
if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Plugin configuration: NERDTree
map <leader>f :NERDTreeToggle<CR>
map <leader>F :NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeNodeDelimiter = "\u00a0" " temporary workaround

" Plugin configuration: ack.vim
if executable('ag')
  let g:ackprg='ag --vimgrep'
endif
map <leader>g :Ack 
map <leader>G :Ack <cword><CR>

" Plugin configuration: gruvbox
colorscheme gruvbox
set background=dark
highlight Normal ctermbg=NONE
highlight Normal guibg=NONE

" Plugin configuration: vim-airline
let g:airline_powerline_fonts=1

" Plugin configuration: fugitive.vim
map <leader>gd :Git diff<cr>
map <leader>gb :Git blame<cr>

" Plugin configuration: ctrlp.vim
let g:ctrlp_cmd='CtrlPMRU'
map <leader>b :CtrlPBuffer<cr>

" Plugin configuration: togglelist.vim
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" Plugin configuration: ale
let g:ale_fixers={
\ 'c': ['clang-format'],
\ 'cpp': ['clang-format'],
\ 'javascript': ['prettier', 'eslint'],
\ 'typescript': ['prettier', 'eslint'],
\ 'markdown': ['prettier'],
\ 'python': ['autopep8'],
\ 'rust': ['rustfmt'],
\ 'typescriptreact': ['prettier', 'tslint'],
\ 'yaml': ['yamlfix'],
\ 'nix': ['alejandra'],
\}
let g:ale_set_signs=0
map <leader>d :ALEGoToDefinition<cr>
map <leader>p :ALEFix<cr>

" Plugin configuration: tagbar
map <leader>t :TagbarToggle<CR>
let g:tagbar_sort=0

" Plugin configuration: YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vimconf/ycm_extra_conf.py'
if has('python3')
  silent! python3 1
endif
if has('macunix')
  let g:ycm_filter_diagnostics={
  \  "cpp": {
  \    "regex": [
  \      ".*__builtin_ia32_pavgw128.*",
  \      ".*__builtin_ia32_pavgb128.*",
  \      ".*no member named '(signbit|fpclassify|isfinite|isinf|isnan|isnormal|isgreater|isgreaterequal|isless|islessequal|islessgreater|isunordered)' in the global namespace.*"
  \    ],
  \  },
  \}
endif
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_always_populate_location_list=1
let g:ycm_enable_diagnostic_signs=0
let g:ycm_confirm_extra_conf=0
let g:ycm_auto_hover=''
map <leader>r :YcmForceCompileAndDiagnostics<cr>
map <leader>i :YcmCompleter GetType<cr>
nmap <leader>h <plug>(YCMHover)

" Plugin configuration: grayout.vim
autocmd FileType cpp GrayoutUpdate
autocmd BufWrite *.[ch]{,pp,xx}\|*.cc|*.hh :GrayoutUpdate

" Plugin configuration: rust.vim
let g:rust_use_custom_ctags_defs = 1
if !exists('g:tagbar_type_rust')
   let g:tagbar_type_rust = {
       \ 'ctagstype' : 'rust',
       \ 'kinds' : [
         \'M:macro,Macro Definition',
         \'P:method,A method',
         \'c:implementation,implementation',
         \'e:enumerator,An enum variant',
         \'f:function,Function',
         \'g:enum,Enum',
         \'i:interface,trait interface',
         \'m:field,A struct field',
         \'n:module,module',
         \'s:struct,structural type',
         \'t:typedef,Type Alias',
         \'v:variable,Global variable',
       \ ]
   \ }
 endif

" Plugin configuration: vim-anyfold
set foldlevel=0
" activate anyfold by default
augroup anyfold
    autocmd!
    autocmd Filetype cpp AnyFoldActivate
augroup END
" disable anyfold for large files
let g:LargeFile = 1000000 " file is large if size greater than 1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
function! LargeFile()
    augroup anyfold
        autocmd! " remove AnyFoldActivate
        autocmd Filetype cpp setlocal foldmethod=indent " fall back to indent folding
    augroup END
endfunction

" Plugin configuration: vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
