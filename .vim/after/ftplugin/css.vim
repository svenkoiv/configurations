" Css
setlocal suffixesadd+=.css,.scss,.less
" Tabs
setlocal smarttab
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let b:ale_fixers = {
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'less': ['prettier'],
\}
