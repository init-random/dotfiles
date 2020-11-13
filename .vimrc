" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

set nocompatible
filetype plugin indent on 
syntax enable



" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the config down below 
" as you wish :)
" IMPORTANT: some things in the config are vim or neovim specific. It's easy 
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.


call plug#begin('~/.vim/plugged')


" Make sure you use single quotes

Plug 'maxbrunsfeld/vim-yankstack'
Plug 'majutsushi/tagbar'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sharkdp/bat'
Plug 'jremmen/vim-ripgrep'
Plug 'justinmk/vim-sneak'

Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'jpalardy/vim-slime'

Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'

" Search results counter
" Plug 'vim-scripts/IndexedSearch'
" A couple of nice colorschemes
" Plug 'fisadev/fisa-vim-colorscheme'
" Plug 'patstockwell/vim-monokai-tasty'
" Override configs by directory
" Plug 'coacher/vim-virtualenv'
" Plug 'arielrossanigo/dir-configs-override.vim'
" Code commenter
" Plug 'scrooloose/nerdcommenter'
" Class/module browser
" non-active plugs to research
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Valloric/YouCompleteMe'
" Plug 'altercation/vim-colors-solarized'
" Consoles as buffers (neovim has its own consoles as buffers)
" Plug 'rosenfeld/conque-term'
" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Pending tasks list
" Plug 'fisadev/FixedTaskList.vim'
" Async autocompletion
" Plug 'Shougo/deoplete.nvim'
" Python autocompletion
" Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
" Plug 'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
" Plug 'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
" Plug 'Townk/vim-autoclose'
" Surround
" Plug 'tpope/vim-surround'
" Indent text object
" Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
" Plug 'jeetsukumaran/vim-indentwise'
" Better language packs
" Ack code search (requires ack installed in the system)
" Plug 'mileszs/ack.vim'
" Paint css colors with the real color
" Plug 'lilydjwg/colorizer'
" Window chooser
" Plug 't9md/vim-choosewin'
" Automatically sort python imports
" Plug 'fisadev/vim-isort'
" Highlight matching html tags
" Plug 'valloric/MatchTagAlways'
" Generate html in a simple way
" Plug 'mattn/emmet-vim'
" Git integration
" Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
" Plug 'mhinz/vim-signify'
" Yank history navigation
" Plug 'vim-scripts/YankRing.vim'
" Linters
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
" Plug 'myusuf3/numbers.vim'
" Nice icons in the file explorer and file type status line.
" Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:deoplete#enable_at_startup = 1


" wrap end of line
set whichwrap+=<,>,h,l,[,]
set scrolloff=4

" shift arrow to init visual mode
nmap <S-Up> vk
vmap <S-Up> k 
nmap <S-Down> vj
vmap <S-Down> j
nmap <S-Left> vl
vmap <S-Left> l
nmap <S-Right> vh
vmap <S-Right> h

" terminal-like  bindings for insert mode
imap <C-b> <ESC>i
imap <C-f> <ESC>lli
" and in command-mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" a nice escape
imap <C-a> <ESC>:w<CR>

" cycle through jumplist
nmap <C-S-Left> g;
nmap <C-S-Right> g,
 
imap <C-s> <Esc>/


let g:python3_host_prog = expand('~/anaconda/envs/torch/bin/python')

" python with virtualenv support
py3 << EOF
import os, sys, pathlib
if 'VIRTUAL_ENV' in os.environ:
    venv = os.getenv('VIRTUAL_ENV')
    site_packages = next(pathlib.Path(venv, 'lib').glob('python*/site-packages'), None)
    if site_packages:
        sys.path.insert(0, str(site_packages))
        print(site_packages)
EOF

" set laststatus=2  " always display the status line


set incsearch
set hlsearch
set ignorecase
set smartcase


let mapleader=";"
let maplocalleader=";"
map <leader>w :set wrap<CR>
vmap <leader>y "+y
vmap <leader>c "+c
map <leader>p  "+gP
map <leader>f !fmt -100
map <leader>r :e!<CR>G
imap <C-h> <Esc>vh
imap <C-j> <Esc>vj
imap <C-k> <Esc>vk
imap <C-l> <Esc>vl

" re-init snippets on save
au BufWritePost *.snippets :call UltiSnips#RefreshSnippets()
au BufWritePost $HOME/.vimrc :so $HOME/.vimrc

au BufNewFile,BufRead Makefile
    \ set tabstop=4 |
    \ set shiftwidth=4

au BufNewFile,BufRead *.tex,*.txt
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=100 |
    \ set fileformat=unix 

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

autocmd vimenter * 
    \ colorscheme slate |
    \ colorscheme gruvbox


hi CursorLine guibg=Grey25
set cursorline
au BufRead * :hi Visual gui=None term=None cterm=None ctermbg=015 guibg=#196FD9

" slime settings
" c-enter - sent to terminal
nmap <C-CR> V<C-c><C-c>
vmap <C-CR> <C-c><C-c>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set wildchar=<Tab> 
set wildmenu wildmode=longest,list,full
set completeopt=longest,menuone

" else condition; not autoselect on menuone
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>\<C-p>"

function! VimrcEdit()
    tabnew ~/.vimrc
endfunction

command! VimrcEdit call VimrcEdit()

" delete buffer w/o loosing split
nmap <C-w>d :bp<Enter>:bd #<Enter>
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

"remove gui toolbar
:set guioptions-=T  

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']


nmap <F5> :make<CR>
imap <C-e> <Esc>A

set norelativenumber
set number

let g:startify_change_to_vcs_root = 1

command! -bang -nargs=* GG
  \ call fzf#vim#grep(
  \   'rg --column --line-number --smart-case --no-heading --type-not jupyter --type-not gzip --color=always -g ' . <q-args> . ' ' . shellescape(''), 1,
  \   <bang>1 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'),
  \   <bang>1)

command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --line-number --smart-case --no-heading --type-not jupyter --type-not gzip --color=always '.shellescape(<q-args>), 1,
  \   <bang>1 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%'),
  \   <bang>1)

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

