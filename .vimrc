filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

Plugin 'fxn/vim-monochrome'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'

call vundle#end()

""""""""""""""""""""
" General
""""""""""""""""""""

" Leader key
let mapleader = ","

" Sets how many lines of history VIM has to remember
set history=250

" Line numbers
set rnu
set nu

" Disable buffer error E37: No write since last change
set hidden

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Set 7 lines to the cursor when scrolling
set so=7

" Allow command line completion
set wildmenu
set wildcharm=<C-z>
nnoremap ,e :e **/*<C-z><S-Tab>

" Fzf
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

 " [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files!<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>B :Buffers!<CR>
nnoremap <silent> <leader>s :Rg<CR>
nnoremap <silent> <leader>l :Lines<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Ignore compiled command line files

if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set wildignore=*.o,*~,*.pyc
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set wildignore+=*/build/*

" After pressing ,e and the directory doesn't exist then it creates one
" :!mkdir -p %:h

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set nohlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

syntax enable
set encoding=utf8

" Tabbing configuration
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Delete trailing whitespace on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Enable filetype plugins
filetype plugin indent on
filetype plugin on
filetype indent on

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

""""""""""""""""""""
" Plugins
""""""""""""""""""""
colorscheme monochrome

" nerdtree
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDTreeAutoDeleteBuffer = 1
"map <C-n> :NERDTreeToggle<CR>

" On file close, close nerdtree if there are no opened files
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Create the 'tags' file (may need to install ctags first)
" ctags -R .
