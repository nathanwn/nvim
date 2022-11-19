call SetIndentSize(2)
setlocal omnifunc=pandoc#completion#Complete
nnoremap <buffer> <silent> <Leader>pdn :execute 'Pandoc pdf --defaults='.expand('$HOME').'/.config/pandoc/notes.yaml --resource-path=.:'.expand('$HOME').'/.config/pandoc --citeproc -H '.expand('$HOME').'/.config/pandoc/disablefloat.tex'<CR>
