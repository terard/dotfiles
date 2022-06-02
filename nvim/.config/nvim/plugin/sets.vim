"set exrc
set number
set rnu

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set smarttab

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
"set hlsearch!
"nnoremap <CR> :set hlsearch!<CR>

"set hlsearch
set incsearch

set signcolumn=yes

set noswapfile
set nowrap
set nobackup

set undodir=~/.vim/undodir
set undofile

set termguicolors
set scrolloff=8

set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=120

set pastetoggle=<F2>
set clipboard=unnamed

set history=1000
set undolevels=1000

set showmatch
set cursorline
set cmdheight=2
set switchbuf=useopen

"set updatetime=50

" If a file is changed outside of vim, automatically reload it without asking
set autoread
