/"These first options are old, not sure what they do
"
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"let g:Tex_ViewRule_pdf = 'Preview'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
let g:tex_indent_items = 0
"let g:LatexBox_viewer = 'open'

"Setting some tex specific options
setlocal spell

setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal autoindent
setlocal linebreak

"Enabling inverse search (From Skim to vim)
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'Skim'

"Disable fold
"let g:Tex_AutoFolding = 0
let g:Tex_GotoError = '0'

"Add vim-surrond for latex command, using char c
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
