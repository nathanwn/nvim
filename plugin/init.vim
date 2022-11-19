" Stuff that I have not been able to convert to lua

function SetIndentSize(indentsize)
  let &l:tabstop     = a:indentsize
  let &l:shiftwidth  = a:indentsize
  let &l:softtabstop = a:indentsize
endfunction

function ToggleConceal()
  if s:conceal_on
    set conceallevel=2
    let s:conceal_on = 0
  else
    set conceallevel=0
    let s:conceal_on = 1
  endif
endfunction

function RemoveTrailingWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

function GetCharUnderCursor()
  return matchstr(getline('.'), '\%' . col('.') . 'c.')
endfunction

function VisualLength()
  exe 'normal "xy'
  return strlen(@x)
endfunction

function AlignCenter(end_col)
  exe 'normal 0'
  if GetCharUnderCursor() == ' '
    exe 'normal w'
  endif
  " select the text
  exe 'normal wv$'
  " calculate selected length
  let select_len = VisualLength()
  " put the cursor at the first comment character
  exe 'normal 0'
  if GetCharUnderCursor() == ' '
    exe 'normal w'
  endif
  " jump to the next <SPACE> after the comment characters
  exe 'normal f '
  " delete spaces before the text
  exe 'normal dw'
  " calculate the number of spaces to insert
  let num_spaces = (a:end_col - col('.') + 1) / 2 - (select_len / 2) - 1
  " pad spaces
  exe 'normal ' . string(num_spaces) . 'i '
  echo "Aligned to center!"
endfunction

function GetCurrentPathToClipboard()
  let @+=expand("%:p")
  echo "Path copied!"
endfunction

" Show syntax highlighting groups for word under cursor
function! SynStack()
  if !exists("*synstack")
    echo "error"
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
function! SynStackPrevLine()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.')-1, col('.')), 'synIDattr(v:val, "name")')
endfunc
" TODO: change these into commands
" nnoremap \st :call SynStack()<CR>
" nnoremap <F8> :call SynStackPrevLine()<CR>
" !command SyntaxGroup call SynStack()

function SyntaxTex()
  call SetIndentSize(2)
endfunction

function SyntaxTypeScript()
  call SetIndentSize(2)
endfunction

autocmd BufEnter,BufNewFile,BufRead *.h set filetype=c
autocmd BufEnter,BufNewFile,BufRead *.clang-format set filetype=yaml
autocmd BufEnter,BufNewFile,BufRead *.md set filetype=markdown

" autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * call RemoveTrailingWhitespace()

" Enter Paste Mode
set pastetoggle=<F3>

" Toggle Conceal
let s:conceal_on = 0
nnoremap \cc :call ToggleConceal()<CR>

" Centering selected text
nnoremap \ac "xy:call AlignCenter(80)<CR>

" Execute selected shell command
vnoremap \ex :w !bash<CR>

" Copy path to clipboard
nnoremap \cp :call GetCurrentPathToClipboard()<CR>
