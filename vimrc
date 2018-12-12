""""" Vundle stuff
set nocompatible              " be iMproved, required

" Setting up Vundle - the vim plugin bundler
" iCanHazVundle can be used later to call :PluginInstall
" check: https://github.com/fisadev/fisa-vim-config/blob/master/.vimrc
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'Gundo' 
Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'motus/pig.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe' 
"Plugin 'davidhalter/jedi-vim'


" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
"Plugin 'https://github.com/mephux/bro.vim'
"Plugin 'https://github.com/vim-scripts/pac.vim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""" General vimrc

"if has("gui_running")
let g:airline_powerline_fonts = 1
"endif
"Fancy status line with PowerLine
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
set laststatus=2
"set fillchars+=stl:\ ,stlnc:\

"Attempt to replace <esc> with jk
inoremap jk <esc>

"Destroy buffer but do not close window (split)
nmap ,d :b#<bar>bd#<CR>

set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"I will never use vim with this type of files
set wildignore+=*.so,*.swp,*.zip,*.aux,*.pdf
set wildignorecase "ignore case when completing filenames

set hidden

set linebreak
set tabstop=4
set shiftwidth=4

"more history!
set hi=1000

"set switchbuf=usetab,newtab

"Right mouse button == menu - useful for spell check
set mousemodel=popup

"small w big W whaterver
command W w

" colors
set t_Co=256
let g:solarized_termcolors=256 " color depth
set background=dark
colorscheme solarized

"do add to single character deletes to register
vnoremap x "_x

"let g:SuperTabDefaultCompletionType = "<c-x><c-n>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let :g:SuperTabDefaultCompletionType = "<c-n>"
"set completeopt=longest,menuone,preview

"go to file in a new tab
"map gf <C-w>gf
"
"map \d to black hole register
map \d "_d

"map \p to last yank paste
map \p "0p
map \P "0P

"Maps for soft wraps
map k gk
map j gj
vmap k gk
vmap j gj
"map <UP> g<UP>
"map <Down> g<Down>
"vmap <UP> g<UP>
"vmap <Down> g<Down>
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk

"map to select last pasted block
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"Vim latex stuff
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*
"TODO: is this doing somehting?
let g:tex_flavor='latex' "what is plaintex?
" enable folding...
"let g:LatexBox_Folding=1
" ... but do not fold the preamble
let g:LatexBox_fold_preamble = 0

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
"set autochdir

" This shows what you are typing as a command.  
set showcmd

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

" It seems some python mode options have to be set here
" as does not work on ftplugin/python
" Disable pylint checking every save
let g:pymode_lint_write = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

au BufNewFile,BufRead *.mkd set filetype=markdown
au BufNewFile,BufRead *.pac set filetype=pac

set guifont=Inconsolata\ for\ Powerline:h16

"going to try to disable arrows
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

if has("unix")
  "linux copy and paste
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <ESC>"+pa
endif

"short command for openning a terminal
cnoreabbrev gt !gnome-terminal

"Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args='--ignore=E731,E116,E114'

let g:gundo_prefer_python3 = 1

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

set completeopt-=preview
" complete as much as possible, then a list and then cycle
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildignorecase "ignore case when completing filenames

set number
