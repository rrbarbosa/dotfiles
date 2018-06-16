call plug#begin('~/.config/nvim_plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'fntlnz/atags.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'

call plug#end()
set hidden "avoid closing usaved hidden buffers
set number

" tell deoplete we to use this python
let g:python3_host_prog = '/Users/rafael/.venvs/nvim/bin/python'

"let g:Powerline_symbols = 'unicode'
let g:airline_powerline_fonts = 1

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {"passive_filetypes": ["scala"]}
let g:ale_python_flake8_executable = '/Users/rafael/.venvs/nvim/bin/python3'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'python': ['flake8'],
\}


" colors
"set t_Co=256
let g:solarized_termcolors=256 " color depth
set background=dark
colorscheme solarized

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"Destroy buffer but do not close window (split)
nmap ,d :b#<bar>bd#<CR>
"
"set a persistent undo file
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
"more history!
set hi=1000

"map \d to black hole register
map \d "_d

"map \p to last yank paste
map \p "0p
map \P "0P

"map to select last pasted block
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" This shows what you are typing as a command.  
set showcmd


" Removes trailing spaces
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" supertab forward 
let g:SuperTabDefaultCompletionType = "<c-n>"

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
"set autochdir

" (rip) Greping
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"
" Automatically open quickfix window after grep'ing
autocmd QuickFixCmdPost *grep* cwindow
"
" Grep TODO tags
function! TodoGrep()
  execute "grep TODO -r %"
  execute "cw"
endfunction

command Todo call TodoGrep()

" complete as much as possible, then a list and then cycle
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildignorecase "ignore case when completing filenames

" is there any situation where 8 spaces for a tab is justified?
setlocal shiftwidth=4
setlocal tabstop=4

" make :bd to close location list (with Syntastic errors)
"nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
"cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

autocmd BufNewFile,BufRead *.sc   set filetype=scala

" hide netrw banner
let g:netrw_banner = 0

" Fzf settings
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>f :Files<CR>
