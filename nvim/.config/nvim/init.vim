let mapleader=","

" initialize plugins
call plug#begin('~/.vim/plugged')

Plug 'roman/golden-ratio'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'

Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-surround'

" colors
Plug 'gruvbox-community/gruvbox'

" fuzziness
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'sbdchd/neoformat'
let g:neoformat_try_node_exe = 1

" ruby and rails
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'

call plug#end()

" maps
nnoremap <leader>f :Neoformat<CR>

nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-h>  <C-w>h
nnoremap <C-l>  <C-w>l
nnoremap <leader><leader> <c-^>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

nnoremap zz :update<cr>
nnoremap ww :update<cr>

" for telescope and friends?
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

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

augroup TRAV_HIMSELF
  autocmd!

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  autocmd BufWritePre *.rb Neoformat
  "autocmd BufWritePre,InsertLeave *.js Neoformat
  "autocmd BufWritePre,InsertLeave *.jsx Neoformat
  "autocmd BufWritePre,InsertLeave *.css Neoformat
  autocmd BufWritePre,InsertLeave *.scss Neoformat
  autocmd BufWritePre,InsertLeave *.tsx,*.ts,*.jsx,*.js EslintFixAll
augroup end
