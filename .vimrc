call plug#begin('~/.vim/plugged')

set rtp+=~/.fzf

Plug 'fxn/vim-monochrome'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype plugin indent on

"----------------------------------------
" CONFIGURATION
"----------------------------------------
syntax enable
colorscheme monochrome
set encoding=utf8
let mapleader = ","
set autoindent
set listchars=tab:▸\ ,eol:¬
" In insert mode disable Esc key sequences (e.g 'O' has no delay after this).
set noesckeys
"set clipboard=unnamedplus
" Clear gutter design
highlight clear SignColumn
" Case sensitive search.
set smartcase
" Highlight search results
set hlsearch
" Command-lines that you enter are remembered in a history table.
set history=250
" Scroll offset determines the number of context lines you would like to see
" above and below the cursor.
set scrolloff=7
" Show line numbers in navigation menu.
set relativenumber
set number
" E37: No write since last change.
set hidden
" Change cursor when in insert mode
au InsertEnter * silent execute "!echo -en \<esc>[0 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
" Update the file if the change is detected.
set autoread
set pumheight=7
" Provides tab-completion for all file-related tasks
set path+=**
let g:airline_powerline_fonts=1
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files!<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>B :Buffers!<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>
" Disable arrow keys in normal and in insert mode.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Ignore compiled command line files.
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=240 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

"----------------------------------------
" PLUGINS
"----------------------------------------

" FZF
"----------------------------------------
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


" ALE
"----------------------------------------
" let g:ale_fix_on_save = 1
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
let g:ale_set_highlights = 0
highlight ALEErrorSign ctermfg=9 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 guifg=#ED6237 guibg=#F5F5F5
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Coc
"----------------------------------------
nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <c-@> coc#refresh()

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" set signcolumn=yes



"----------------------------------------
" USEFUL
"----------------------------------------
" Guide how to have project specific .vimrc. This
" is good when projects with same language have different rules.
" https://andrew.stwrt.ca/posts/project-specific-vimrc/
"----------------------------------------
" Create your own rules for that specific file type. If the same
" rules should be applied to other files aswell then create symlinks.
" ln -s ~/.vim/after/ftplugin/c.vim ~/.vim/after/ftplugin/cpp.vim
"----------------------------------------
