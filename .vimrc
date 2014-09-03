set nocompatible 
set modelines=0
filetype plugin indent on
syntax on
colorscheme xoria256 

set number
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8
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

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
"set shellslash
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

"" Status mod
hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

"au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
"au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction 

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

execute pathogen#infect()
map <F4> :NERDTreeToggle<CR>
let g:EasyMotion_leader_key = '<Leader>'
let g:tagbar_type_javascript = { 'ctagsbin' : 'C:\Program Files\nodejs\jsctags.cmd' }
nmap <F8> :TagbarToggle<CR>

let g:syntastic_javascript_checkers = ['jsxhint']
