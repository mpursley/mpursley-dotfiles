
" Added for Vundle...
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" added nerdtree
Plugin 'scrooloose/nerdtree'

" install SimpleFold
"Plugin 'tmhedberg/SimpylFold'

" add vim-colorschemes
Plugin 'flazz/vim-colorschemes'

"add jedi-vim
Plugin 'davidhalter/jedi-vim'

" add ctags
"Plugin 'universal-ctags/ctags'

" add surround
"Plugin 'tpope/vim-surround'

" add ctrlp
Plugin 'kien/ctrlp.vim'

" add flake8
Plugin 'nvie/vim-flake8'

" add python-mode
Plugin 'python-mode/python-mode'

" add pyflakes
Plugin 'kevinw/pyflakes-vim'

call vundle#end()            " required
"filetype plugin indent on    " required
"
" /Added for Vundle...


" add recursive paths
set path+=**

" turn on the wildmenu, from python-mode
set wildmenu


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

"set pastetoggle=<F2>
"set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again
" This is a fix for resizing vim splits while inside tmux
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
" noremap <C-n> :nohl<CR>
" vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>:suspend<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>q :quit<CR>  " Quit current window
noremap <Leader>Q :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>

" start NerdTree
map <Leader>f <esc>:NERDTree<CR>

" start NerdTree
map <Leader>e <esc>:MiniBufExplorer<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


"" add 256 color scheme (this also requires Plugin 'flazz/vim-colorschemes')
set t_Co=256
color wombat256mod


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on


"" Showing line numbers and length
set number    " show line numbers
set tw=120     " width of document (used by gd)
set relativenumber
""set nowrap  " don't automatically wrap on load
set wrap      " automatically wrap on load
""set fo-=t   " don't automatically wrap text when typing
set colorcolumn=120
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set noexpandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Enable folding
set foldmethod=indent
set foldlevel=99

" PEP 8 for indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


let g:jedi#use_tabs_not_buffers = 1


" powerline
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
