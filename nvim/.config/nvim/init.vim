set shell=/bin/zsh

let mapleader=","

" initialize plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'roman/golden-ratio'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'

Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-surround'

Plug 'github/copilot.vim'

" colors
Plug 'gruvbox-community/gruvbox'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" fuzziness
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'kchmck/vim-coffee-script'

Plug 'eslint/eslint'
Plug 'hrsh7th/vscode-langservers-extracted'

Plug 'tomlion/vim-solidity'

Plug 'sbdchd/neoformat'
let g:neoformat_try_node_exe = 1

" ruby and rails
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'

" maybe play with settings?
" Plug 'jiangmiao/auto-pairs'

call plug#end()

"set rtp+=/opt/homebrew/opt/fzf
set rtp+=/usr/local/opt/fzf


" maps
"nnoremap <leader>f :Neoformat<CR>
nnoremap <leader>f gg=G``


nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-h>  <C-w>h
nnoremap <C-l>  <C-w>l
nnoremap <leader><leader> <c-^>

"nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader><CR> :so $XDG_CONFIG_HOME/nvim/init.vim<CR>

nnoremap <leader>x :silent !chmod +x %<CR>

nnoremap zz :update<cr>
nnoremap ww :update<cr>

"nnoremap <leader>c :Sex!<cr>
nnoremap <leader>c :Ex!<cr>

" for telescope and friends?
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

"au BufNewFile,BufRead *.sol setfiletype solidity

"" display incomplete commands
"set showcmd
"" Enable highlighting for syntax
"syntax on
"" Enable file type detection.
"" Use the default filetype settings, so that mail gets 'tw' set to 72,
"" 'cindent' is on in C files, etc.
"" Also load indent files, to automatically do language-dependent indenting.
"filetype plugin indent on


lua require("travhimself")

" let test#neovim#term_position = "vert"
" let test#strategy = "neovim"
let test#strategy = "basic"

" running tests
nnoremap <leader>t :call RunTestFile()<CR>

function! RunTestFile()
  " Write the file and run tests for the given filename
  if expand("%") != ""
    :update " only write if changed? could use :w
    " for minitest: make sure parallel is off so we can `pry`
    if filereadable("Gemfile") && strlen(glob("test/**/*.rb"))
      :let $PARALLEL_WORKERS = 0
    endif

    if exists('g:test#last_command')
      :TestLast
    else
      :TestFile
    endif
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1  || match(current_file, '\<services\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
  let typo = {}
  let typo["“"] = '"'
  let typo["”"] = '"'
  let typo["‘"] = "'"
  let typo["’"] = "'"
  let typo["–"] = '--'
  let typo["—"] = '---'
  let typo["…"] = '...'
  :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

nnoremap <Leader>r :call VisualFindAndReplace()<CR>
xnoremap <Leader>r :call VisualFindAndReplaceWithSelection()<CR>
function! VisualFindAndReplace()
  :OverCommandLine%s/
  :w
endfunction
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
  :w
endfunction


augroup TRAV_HIMSELF
  autocmd!

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  " remove trailing whitespace on save
  " TODO: do this the Lua (nvim) way
  autocmd BufWritePre * :%s/\s\+$//e

  "autocmd BufWritePre *.rb Neoformat
  "autocmd BufWritePre,InsertLeave *.tsx,*.ts,*.jsx,*.js Neoformat
  "autocmd BufWritePre,InsertLeave *.jsx Neoformat
  "autocmd BufWritePre,InsertLeave *.css Neoformat
  "autocmd BufWritePre,InsertLeave *.scss Neoformat
  "autocmd BufWritePre,InsertLeave *.tsx,*.ts,*.jsx,*.js EslintFixAll
augroup end
