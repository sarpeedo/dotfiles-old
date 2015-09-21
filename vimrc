" Author: Sarp Orgul
" File: .vimrc
" ------------------
" Vim Settings

set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" colorsheme
Plug 'morhetz/gruvbox'

" vim interface
Plug 'bling/vim-airline' "airline bar
Plug 'kien/ctrlp.vim' "fuzzy finder
Plug 'scrooloose/syntastic' "syntax highlighting
Plug 'scrooloose/nerdtree' "foldertree-bar
Plug 'nathanaelkane/vim-indent-guides' "shows vim indents

" speeding up vim
Plug 'terryma/vim-multiple-cursors' "for sublime like editing in vim

" git plugins
Plug 'tpope/vim-fugitive' "git commands in vim
Plug 'airblade/vim-gitgutter' "git diff in left bar

" vim tags
Plug 'majutsushi/tagbar' "shows tags from file
Plug 'xolox/vim-misc' "dep for easytags
Plug 'xolox/vim-easytags' "tag generation from files

" prose editing
Plug 'junegunn/goyo.vim' "distraction free mode in vim

" document conversion
Plug 'vim-pandoc/vim-pandoc' "for pandoc and markdown in vim

" markdown
Plug 'suan/vim-instant-markdown' "markdown preview in vim

" Add plugins to &runtimepath
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Visual Settings                                "
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

" tabs w/ tab char equiv to four spaces
set tabstop=4
set shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Gui Settings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"set gui font
set guifont=Inconsolata\ for\ Powerline\ 12

" keep annoying popups out of the way
autocmd FileChangedRO * echohl WarningMsg | echo "File Changed RO" | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "File Changed Shell" | echohl None

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
nnoremap <leader>h :let @/ = ""<CR>
inoremap <leader>h <Esc>:let @/ = ""<CR>a

" Ctrl S for save Ctrl G for sudo save
nnoremap <leader>s :w<CR>
inoremap <leader>s <Esc>:w<CR>a
nnoremap <leader>g :w !sudo tee % > /dev/null<CR>
inoremap <leader>g <Esc>:w !sudo tee % > /dev/null<CR><CR>a

" map control-backspace to delete the previous word
imap <C-BS> <C-W>

" quit vim remap
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" all md files are markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" swap absolute and relative line numbers
function! g:ToggleNuMode()
    if(&rnu == 1)
        set nornu
    else
        set rnu
    endif
endfunc

nnoremap <C-l> :call g:ToggleNuMode()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline_powerline_fonts=1

" Gruvbox
let g:gruvbox_italic=0

" Vim Instant Markdown
let g:instant_markdown_autostart = 0
autocmd FileType markdown nnoremap <C-e> :InstantMarkdownPreview<cr>

" Tagbar default binding tab
nnoremap <C-i> :TagbarToggle<cr>

" NERDtree
nnoremap <leader>n :NERDTreeToggle<cr>

" CtrlP
nnoremap <Space> :CtrlP<cr>
