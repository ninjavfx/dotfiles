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

