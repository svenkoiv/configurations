call plug#begin('~/.vim/plugged')

set rtp+=~/.fzf

Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

"----------------------------------------
" CONFIGURATION
"----------------------------------------
colorscheme base16-grayscale-dark
" When 'wildmenu' is on, command-line completion operates in an enhanced
" mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
set wildmenu
set encoding=utf8
let mapleader = ","
set autoindent
set listchars=tab:▸\ ,eol:¬
set relativenumber
set number
" Fix noticable delay when pressing 'O'.
set timeoutlen=1000
set ttimeoutlen=0
" Gutter has design which is not same as default background
highlight clear SignColumn
" Make search case sensitive.
set smartcase
" Highlight search results
set hlsearch
" Amount of commands which are stored in history table.
set history=350
" Scroll offset determines the number of context lines you would like to see
" above and below the cursor. 
set scrolloff=5
" It should be possible to open buffers without saving current buffer. (E37: No write since last change).
set hidden
" Display different cursors when in insert mode
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread
" Determines the maximum number of items to show in the popup menu for
" Insert mode completion.  When zero as much space as available is used.
set pumheight=7
" Discourage the use of arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Custom colors for autocompletion
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=240 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

"----------------------------------------
" PLUGIN CONFIGURATIONS
"----------------------------------------
" FZF
"----------------------------------------
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files!<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>B :Buffers!<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>
nnoremap <silent> <leader>c :Commands<CR>
nnoremap <silent> <leader>, :only<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Coc
"----------------------------------------
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gn <Plug>(coc-rename)

let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-prettier',
        \ 'coc-eslint',
        \ 'coc-tslint',
        \ 'coc-marketplace',
        \ 'coc-java',
        \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" NERDTree
"----------------------------------------
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
