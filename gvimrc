let g:ropevim_extended_complete=1
let g:ropevim_vim_completion=1

map <PageUp> <C-U>
imap <PageUp> <Esc><C-U>i
map <PageDown> <C-D>
imap <PageDown> <Esc><C-D>

nnoremap \u :GundoToggle<CR>
nmap <a-LeftMouse> <LeftMouse>:!open <cfile><cr>

"colorscheme lucius

"Default font size
set guifont=Consolas:h15

" visualbell
set vb t_vb=
