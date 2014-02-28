" Disable pylint checking every save
let g:pymode_options=0

" Load pylint code plugin
let g:pymode_lint=0

" (Not) Check code every save
let g:pymode_lint_write=0

" Automatic stuff sucks
let g:pymode_utils_whitespaces=0


setlocal number
setlocal nowrap
setlocal textwidth=0

" Maps for rope commands - Gotta learn more!
map <leader>j :RopeGotoDefinition<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>79v.\+/

" Diable omni-completion 'scratch window' after cursor is used or after
" leaving insert mode
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
