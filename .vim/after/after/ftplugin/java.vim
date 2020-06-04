" Tabs
setlocal smarttab
setlocal expandtab
setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4

"----------------------------------------
" PLUGINS
"----------------------------------------

" ALE
"----------------------------------------
let b:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let b:ale_java_checkstyle_config = '*/checkstyle.xml'
