colorscheme slate
syntax on
set hlsearch
set incsearch
set ignorecase
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set number
set wrap
set autochdir
set modeline
" set backupdir=~/.vim/bak
set directory=.,$TEMP
set guioptions-=T
filetype on
filetype indent on
filetype plugin on
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au! BufRead,BufNewFile *.vtl setfiletype velocity
" au BufEnter *.org            call org#SetOrgFileType()

tab all
let mapleader=";"
let maplocalleader=";"
map <leader>w :set wrap<CR>
vmap <leader>y "+y
vmap <leader>c "+c
map <leader>p  "+gP
map <leader>f !fmt -100
map <leader>r :e!<CR>G
map <leader>ct ya<f>pbi/<ESC>ba
nmap <leader>v *
imap <C-b> <ESC>i
imap <C-f> <ESC>lli
imap <C-a> <ESC>:w<CR>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
 
hi CursorLine guibg=Grey25

set wildchar=<Tab> wildmenu wildmode=full

let g:NERDTreeMapHelp="<F12>"
let g:NERDTreeDirArrows=1

" call pathogen#infect()

function AsTmpFile(...)
    if !exists("~/.vim/tmp")
        let l:t=system("mkdir ~/.vim/tmp")
        unlet l:t
    endif
    let l:fname="_".system("date | md5sum | cut -d' ' -f1")
    let l:fname = substitute(l:fname, '\n$', '', '')
    let l:suffix=".txt"
    if exists("a:1")
        let l:suffix=".".a:1
    endif
    let l:fname=l:fname . l:suffix
    execute ":w ~/.vim/tmp/" . l:fname
endfunction
                                                                    
