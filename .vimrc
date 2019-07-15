call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'myusuf3/numbers.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
call plug#end()

set nobackup
set nowritebackup
set cmdheight=2
set hidden
set updatetime=300
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"

set scrolloff=999
imap jj <ESC>
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

map <F4> :NERDTreeToggle<CR>

" EASYMOTION CONFIG
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" /EASYMOTION CONFIG

" INCSEARCH
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" /INCSEARCH

if has('macunix')
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
