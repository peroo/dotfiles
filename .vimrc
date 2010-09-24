set nocompatible 
set modelines=0
filetype plugin indent on
syntax on
colorscheme xoria256 

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8
set number
set smartindent
set showmode " Shows mode at bottom
set showcmd "Show line count in visiual mode?
set wildmenu
set wildmode=list:longest " Bash style autocomplete
set ttyfast " Fast terminal, send all data
set ruler
set backspace=indent,eol,start
set laststatus=2
set hidden

let mapleader = ","

" Perl style regexp instead of vim
nnoremap / /\v
vnoremap / /\v
set ignorecase "ignore case when searching
set smartcase "use case if not all lowercase
set gdefault "all substitusions are global
" Incremental search
set incsearch 
set showmatch
set hlsearch
" Clear search highlight
nnoremap <leader><space> :noh<cr>
" Use tab to match bracket pairs instead of %
nnoremap <tab> %
vnoremap <tab> %


" toggle between number and relative number on ,l
nnoremap <leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if &number
    set relativenumber
  else
    set number
  endif
endfunction

" configure tags - add additional tags here or comment out not-used ones
set tags=./tags,./../tags,./*/tags
set tags+=~/.vim/tags/cpp

map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set scrolloff=999
imap jj <ESC>
nnoremap <leader>f :NERDTreeToggle<cr>
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" Navigate screen lines instead of file lines
nnoremap j gj
nnoremap k gk

nnoremap <leader>a :Ack
