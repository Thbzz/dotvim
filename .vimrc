let g:vimrc=expand("<sfile>:p:h")."/.vim/vimrc"

if filereadable(g:vimrc)
    exe 'source' g:vimrc
endif
