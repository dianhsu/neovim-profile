
" file path: ~/SpaceVim.d/autoload/myspacevim.vim

function! myspacevim#before() abort
  let g:neomake_cpp_lint_maker = {
        \ "exe": "clang++", 
        \ "args": ["-fsyntax-only", "-I./", "-std=c++20"],
        \ 'errorformat':
            \ '%-G%f:%s:,' .
            \ '%f:%l:%c: %trror: %m,' .
            \ '%f:%l:%c: %tarning: %m,' .
            \ '%I%f:%l:%c: note: %m,' .
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%I%f:%l: note: %m,'.
            \ '%f:%l: %m'
        \ }
  let g:c_no_curly_error = 1
endfunction

function! myspacevim#after() abort
  let g:neomake_cpp_enabled_makers = ['lint']
  call neomake#configure#automake('nrwi', 500)
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

endfunction
