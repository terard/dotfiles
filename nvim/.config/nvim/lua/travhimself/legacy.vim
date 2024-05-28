"imap <silent><script><expr> <C-y> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true

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
command! RemoveFancyCaracters :call RemoveFancyCaracters()

"nmap <leader>t <Plug>PlenaryTestFile

" sort of a mess since vim-over stopped working
"nnoremap <Leader>r :call VisualFindAndReplace()<CR>
"function! VisualFindAndReplace()
  ":OverCommandLine%s/
  ":w
"endfunction

"nnoremap <leader>r :call VisualFindAndReplaceWithSelection()<CR>
"function! VisualFindAndReplaceWithSelection() range
  "":'<,'>OverCommandLine s/
  "":'<,'> s/
  "":1,40:s/
  ""execute a:firstline . "," . a:lastline . 's/'
  "":a:firstline . "," . a:lastline . 's/'
  "":w
"endfunction

"xnoremap <leader>r :call VisualFindAndReplaceWithSelection()<CR>

"function! VisualFindAndReplaceWithSelection() range
  ""echo a:firstline
  ""echo a:lastline
  "":'<,'> s/\%V
  "":%s/\%V
  "":w
"endfunction

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

"lua <<EOF
"print('hello from lua from vim')
"EOF

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
