" Author: Sarp Orgul
" File: .vimrc
" ------------------
" Vim Settings

set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Visual Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
colorscheme gruvbox
set background=dark

set encoding=utf8
set lazyredraw
set autoindent
set wrap
syntax enable
set number
set cursorline

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Enable 256 colors
set t_Co=256
" Set background and colorshceme
let base16colorspace=256
set background=dark
colorscheme gruvbox
"
" for getting rid of annoying flashing and beeping
set guioptions-=m
autocmd GUIEnter * set vb t_vb=
autocmd VimEnter * set vb t_vb=

"remove menu bar
set guioptions-=m
"remove toolbar
set guioptions-=T
"remove right-hand scroll bar
set guioptions-=r
"remove left-hand scroll bar
set guioptions-=L

" keep annoying popups out of the way
autocmd FileChangedRO * echohl WarningMsg | echo "File Changed RO" | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "File Changed Shell" | echohl None

" tabs w/ tab char equiv to four spaces
set tabstop=4
set shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Vim Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" search settings
set incsearch " search as you type
set hlsearch " highlight search matches
set smartcase
set laststatus=2 " always show status line

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

set tm=500
set autoread
set history=1000
set foldmethod=marker

set undolevels=1000
set backspace=indent,eol,start
set clipboard=unnamedplus

" bracket matching
set showmatch
set mat=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Remaps                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Arrow Keys BEGONE
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Maps jk to esc
inoremap kj <Esc>
inoremap jk <Esc>
vnoremap kj <Esc>
vnoremap jk <Esc>

" Clear last search
nnoremap <C-h> :let @/ = ""<CR>
inoremap <C-h> <Esc>:let @/ = ""<CR>a

" Ctrl S for save Ctrl G for sudo save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-g> :w !sudo tee % > /dev/null<CR>
inoremap <C-g> <Esc>:w !sudo tee % > /dev/null<CR><CR>a

" quit vim remap
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>

" swap colon and semicolon in normal mode
nnoremap : ;
nnoremap ; :

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Auto Commands                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Compiling Remaps Supports (Python,LaTeX,Java,R,sh) TODO: add C, C++ support
set filetype=on
" executes command on file (without the extension)
function CuzJavaIsStupid (command)
   execute "!clear;time " . a:command . " " . expand("%:r")
endfunction

" executes command on file
function RunWith (command)
    execute "w"
    execute "!clear;time " . a:command . " " . expand("%")
endfunction

autocmd FileType tex nnoremap <C-e> :call RunWith("pdflatex")<cr>
autocmd FileType bib nnoremap <C-e> :call RunWith("bibtex")<cr>
autocmd FileType python nnoremap <C-e> :call RunWith("python")<cr>
autocmd FileType java nnoremap <C-e> :call RunWith("javac")<cr><cr>:call CuzJavaIsStupid("java")<cr>
autocmd FileType r nnoremap <C-e> :call RunWith("Rscript")<cr>
autocmd FileType sh nnoremap <C-e> :w<cr>:!./%<cr>

" swap absolute and relative line numbers
function! g:ToggleNuMode()
    if(&rnu == 1)
        set nornu
    else
        set rnu
    endif
endfunc

nnoremap <C-l> :call g:ToggleNuMode()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
set noshowmode
let g:airline_powerline_fonts=1
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" Gruvbox
let g:gruvbox_italic=0


