filetype off
"script manager DO NOT remove
call pathogen#infect()
call pathogen#helptags()

filetype indent plugin on

set nocompatible   " Disable vi-compatibility
"set linebreak
"set hidden
set number
syntax on

set linebreak
set tabstop=4

"more history!
set hi=150

set switchbuf=usetab,newtab

"Completion type
set wildmode=longest,list
set wildmenu

"small w big W whaterver
command W w

colorscheme jellybeans

"Backspace for everything
"set backspace=indent,eol,start

"Command \ to comment toggle
map <D-\> \c<Space>

"Mac keys stuff
set ruler
"map <Esc>[H ^
"imap <Esc>[H <Esc>^a
"map <Esc>[H g0
"imap <Esc>[H <Home>
"map <Esc>[F g$
"imap <Esc>[F <End>
"map <Esc>[5~ <C-U>
"imap <Esc>[5~ <C-U>
"map <Esc>[6~ <C-D>
"imap <Esc>[6~ <C-D>

"map <D-\> \c<Space>
vnoremap x "_x
"map <Esc>[5~ <PageUp>
"imap <Esc>[5~ <PageUp>
"map <Esc>[6~ <PageDown>
"imap <Esc>[6~ <PageDown>

"let g:SuperTabDefaultCompletionType = "<c-x><c-n>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let :g:SuperTabDefaultCompletionType = "<c-n>"
set completeopt=longest,menuone,preview

"nmap <silent> <D-d> :NERDTreeToggle<CR>

"better(?!) go to file
map gf <C-w>gf
"map \d to black hole register
map \d "_d

"map \p to last yank paste
map \p "0p
map \P "0P

"map \y to yank to system clipboard
map \y "*y
"set clipboard=unnamed

"Maps for soft wraps
map <UP> g<UP>
map <Down> g<Down>
vmap <UP> g<UP>
vmap <Down> g<Down>
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"map to select last pasted block
"nnoremap gp `[v`]
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"Vim latex stuff
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex' "what the F* is plaintex?

"
" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
set autochdir

" This shows what you are typing as a command.  
set showcmd

" Incremental searching 
set incsearch

"Python templates! :e new-file.py
"autocmd! BufNewFile * silent! 0r ~/.vim/templates/tmpl.%:e

"Undo tree - gundo
"nnoremap <F6> :GundoToggle<CR>

"force vertical diffs, filler is a default option
set diffopt=filler,vertical

"Set 'g/' to perform whole word search in normal mode
function! SearchWord(word)
    let @/ = '\<' . a:word . '\>'
    normal n
endfunction
command! -nargs=1 SearchWord call SearchWord(<f-args>)
nmap g/ :SearchWord 

"Set softwrap and spell to txt files
autocmd BufRead,BufNewFile   *.txt setlocal wrap linebreak spell

"Fancy status line with PowerLine
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
set laststatus=2
set fillchars+=stl:\ ,stlnc:\

" Removes trailing spaces
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction

" Grep TODO tags
function! TodoGrep()
  execute "grep TODO -r %"
  execute "cw"
endfunction

command Todo call TodoGrep()
