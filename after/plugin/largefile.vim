" disable syntax highlighting in big files
function DisableSyntaxTreesitter()
    echo("Big file, disabling syntax, treesitter and folding")
    if exists(':TSBufDisable')
      exec 'TSBufDisable filetype'
      exec 'TSBufDisable illuminate'
      exec 'TSBufDisable indent_blankline'
      exec 'TSBufDisable lsp'
      exec 'TSBufDisable matchparen'
      exec 'TSBufDisable syntax'
      exec 'TSBufDisable treesitter'
      exec 'TSBufDisable vimopts'
    endif

    set foldmethod=manual
    syntax off
    filetype off
    set noundofile
    set noswapfile
    set noloadplugins
endfunction

augroup BigFileDisable
    autocmd!
    autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 512 * 1024 | exec DisableSyntaxTreesitter() | endif
augroup END
