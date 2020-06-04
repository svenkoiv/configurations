" Javascript
setlocal suffixesadd+=.js,.ts,.tsx,.jsx
" Tabs
setlocal smarttab
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
" Wild
setlocal wildignore+=*/node_modules/*
setlocal wildignore+=*/dist/*
setlocal wildignore+=*/build/*

" For formatting with motions should be typescript specific
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

"----------------------------------------
" PLUGINS
"----------------------------------------

" ALE
"----------------------------------------
let b:ale_javascript_prettier_options = '--print-width 100 --single-quote --trailing-comma'
let b:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}

let b:ale_fix_on_save = 0
let b:ale_linter_aliases = {'typescriptreact': 'typescript'}
