" Custom conceal
" https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode
" https://github.com/lervag/vimtex/blob/master/autoload/vimtex/syntax/core.vim

let s:cmd_symbols = [
      \ ['bigsqcap', '⊓'],
      \]

function! s:match_math_symbols() abort " {{{1
  if !g:vimtex_syntax_conceal.math_symbols | return | endif

  for [l:cmd, l:symbol] in s:cmd_symbols
    execute 'syntax match texMathSymbol'
          \ '"\\' . l:cmd . '\ze\%(\>\|[_^]\)"'
          \ 'contained conceal cchar=' . l:symbol
  endfor
endfunction

call s:match_math_symbols()
