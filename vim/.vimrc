" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()


" Keymaps
nnoremap <space>q :NERDTreeToggle<CR>
nnoremap <space>w :NERDTreeFocus<CR>

set mouse=r
set number
set relativenumber
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup

set nowrap
set ignorecase
set smartcase
set showcmd
set showmode 
set noswapfile

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set termguicolors
colorscheme catppuccin_mocha

filetype on
filetype plugin on
filetype indent on

syntax on

set cursorline

" Status line
set statusline=

set statusline+=\ %F\ %M\ %Y\ %R

set statusline+=%=

set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

set laststatus=2

