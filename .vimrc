set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set fileencoding=utf8
set termencoding=utf8
set number
set smartindent
colorscheme xoria256 
syntax on

set nocp
filetype plugin on
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>
