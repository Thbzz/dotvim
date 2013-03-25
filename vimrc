"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Init
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
" You could also be interested with :options
set nocompatible    " some plugins may not be compatible otherwise
filetype plugin on
filetype indent on
call pathogen#infect()
call pathogen#helptags()

let $VIM_HOME = expand('<sfile>:p:h')
" If you are at EPITA, uncomment the following line!!
let use_epita_coding_style = 1


let t_Co=256
let c_gnu=1               " Highlight GNU gcc specific items ...
let c_space_errors=1      " ... and trailing spaces before a <Tab>

" vimspell
"let loaded_vimspell = 1
let spell_auto_type     = "tex,mail,html,sgml,cvs,none"
let spell_executable    = "aspell"
let spell_language_list = "english,french"
highlight SpellErrors ctermfg=Red guifg=Red cterm=underline gui=underline term=reverse

"let OmniCpp_NamespaceSearch = 2
"==============================================================================
" :Man ls
"runtime ftplugin/man.vim


" to set colorscheme, edit the bundle/csapprox/after/plugin/CSApprox.vim file
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:alternateExtensions_CPP = "hxx"

let g:ycm_global_ycm_extra_conf = "$VIM_HOME/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
"let g:protodefprotogetter = "~/.vim/bundle/ProtoDef/pullproto.pl"
"set tags += "$VIM/tags/cpp"


set background=dark " related to syntax coloration
colorscheme jellybeans
"colorscheme darkbone


"conflose :)
"set revins
"set rightleft


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cb=autoselect
"behave xterm

set restorescreen   " Restores the screen content when exiting vim
set cursorline
set number          " Lines nunbers on the left
set splitbelow      " On split, the new window will be below.
set splitright      " On vsplit, the new window will be on the right
set switchbuf=useopen   " behavior when switching between buffers
set scrolloff=2     " Mininal amount of lines to keep between cursor and top and bottom of screen

" Tabs parameters
set smarttab
set expandtab
set softtabstop=4
"set tabstop=4      " should not be used. See :help tabstop for wayaround
set smarttab
set shiftwidth=4    " width of the shift command (for indentation)

" Text formating
"set columns=84      "Big trick: this is the size of the window
set nowrap
set wrapmargin=79
set textwidth=79    " maximum width of text that is being inserted (brokes after a whitespace)(0 to disable)

set showbreak=\\    " string to put at the start of lines that have been wrapped
set noendofline     " when on, automatically insert a \n at end of lines (including last line of file ...)

" Keys behavior
set backspace=indent,eol,start  " influence the action of <Del> <BS> <Ctrl-W> and <Ctrl-u>
set whichwrap=b,s,l,h,<,>,[,]   " allows keys for moving to move to the previous or next line

" Specific Keys options
set keywordprg=man\ -k  " program to use for the K command
set formatprg=fmt   " program to use to display lines selected with gq command

" Windows parameters
set icon            " set the icon text of the window to 'iconstring'
set title           " set the title of the window to 'titlestring'

" Search
set hlsearch        " hightlight matching result after a search (nohl to desactivate)
set smartcase       " used when searching a pattern with upper case and override ignorecase
set incsearch       " show results while you haven't finished to type the pattern yet

" set showmatch      " when bracket inserted, jump to the corresponding bracket just to show it
" set matchtime=1     " time the matching bracket is showed

" Performances
set synmaxcol=500   " beyond this column, syntax hl is disabled
set ttyfast         " fast terminal connection; improves smoothness when multiple windows opened
set hidden          " do not unload a buffer when abandoning it
set lazyredraw      " do not redraw while execution of cmds is not finished


" Bottom menu
set showcmd         " show partial command at the bottom of the screen
set ruler           " show the line and column of the cursor position
" format of the status line
set statusline=[%n]\ %<%f\ %((%1*%M%*%R%Y)%)\ %=%-19(\Line\ [%4l/%4L]\ \Col\ [%02c%03V]%)\ ascii['%03b']\ %P
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)\ %y\ %{''.&fileencoding}\ %=\ %4l,%02c%2V\ %P%*
set laststatus=2    " always display status line
set pumheight=5     " Max number of items to be displayed on popup menu
set wildmenu        " Menu that shows completion when typing cmds
set wildignore+=*.o " Files to be ignored by wildmenu completion
set wildmode=list:longest,full  " completion mode for wildmenu


" Compatible only with vim >= 7.3
" External files related
" Keeps an history for the undo cmd
set undofile
set undodir=~/.vim/undo
set viminfo='20,\"50    " saves context and restore it when exiting vim
set history=50      " size of the history
set swapsync=       " Must be empty


" files with theses suffixes get a lower priority when matching a wildcard
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"set cpoptions=aABceFs   " flags : indicates specific vi compatible options
set autowrite       " write the content of the file when specific command are typed
set gdefault        " when using %s there is a default implicit /g at the end

" Autocompletion
set complete=t,k,.,w,b,u,i      " specify how autocompletion works
set infercase                   " ignore case when autocompleting
set completeopt=menu,longest "omnicomplete
"set fillchars=stl:=,stlnc:-,vert:\|,fold:-,diff:-


" Indentation
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(0,u0,)20,*30,g0
set autoindent      " basic indentation
set cindent
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l1,ps,t0,+s,(0,u0,)20,*30,g0



set report=50       " commands display a message if nbr of modified lines is more than x (0 always)
set joinspaces      " insert spaces with a join command after some operators
set confirm         " Asks for confirmation when leaving without saving
set display="uhex,lastline"  " Displays unprintable characters as hexa
set autochdir       " When opening a file, buff current dir is changed
"autocmd FileType * set formatoptions-=o "do not comment with the key 'o'
set formatoptions=croql

set foldmethod=syntax   " use the syntax file to hide bunches of code


""""""""""""""""""""
""" Conditionnals
""""""""""""""""""""

" Compatible only with vim >= 7.3
" a little bit complex, cf :help xxx
set concealcursor=nc
set conceallevel=3

if has("mouse")
    set mouse=nv          " Enables use of mouse within specified modes
    set mouse=ar          " enable mouse use
    set mousemodel=extend " sets the model to use for the mouse (see :help ..)
    set mousefocus        " activates a window when the mouse is above it
    set mousehide         " mouse pointer hidden when characters are typed
endif

if filereadable(expand("$HOME/.vimrc.local"))
"  source $HOME/.vimrc.local
endif

if filereadable(expand("$HOME/.vim/systags"))
"  set tags+=~/.vim/systags
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"d
""""                Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("syntax")
  syntax on     " enable syntax (hightlighting)
endif

if has("gui_running")       " In a terminal (and so in fluxbox) it hasn't
    echom "getting in gui_running special options"
  set lines=50
  set columns=85
  set guioptions=acmtl
  set guifont=7x13bold
  set noguipty
  set guicursor=i-ci:ver50-Cursor
  set guicursor=a:blinkon0
  " Change background only if in GUI (not in term)
  highlight Normal gui=NONE guibg=Black guifg=White
endif

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+\%#\@<!$/
highlight OverLength ctermbg=red guibg=red
au Filetype c match OverLength /\%81v.*/
" Color the status line everytime
highlight StatusLine term=reverse  cterm=bold ctermfg=white ctermbg=lightblue gui=bold guifg=white guibg=blue







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My plugins !!!!!!!!
" Updates headers of the files (creation, last modif, authors,...)
"source ~/.vim/plugins/cautofile.vim
"source ~/.vim/plugins/speedbar2.vim
"source ~/.vim/plugins/cautocode.vim

""""""""""""""""""
" std_c.zip
""""""""""""""""""
let c_gnu = 1
let c_space_errors = 1
let c_cpp_comments = 1
let c_comment_strings = 1
let c_no_comment_fold = 1
let c_warn_8bitchars = 1
let c_warn_multichar = 1
let c_warn_digraph = 1
let c_warn_trigraph = 1
let c_no_octal = 1
let c_posix = 1
let c_math = 1
let c_C99 = 1
let c_cpp_warn = 1
let c_syntax_for_h = 1


"""""""""""""""""
" FSwitch
"""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Adding 'nore' to mappings means no reccursivity
" It is highly recommended to prohibit reccursivity in mappings

let mapleader = "`"

" Essential map
inoremap jk <esc>
inoremap JK <esc>
nnoremap ; :

" for long wrapping lines
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
nnoremap <leader>sf :FSHere<CR>
nnoremap <leader>wh :%s/[ \t]\+$//<CR>

" switch buffers more naturally
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>" lbi"<esc>ea"<esc>

" vimrc quick edit
nnoremap <leader>ev :exe 'vsplit' expand(g:vimrc)<cr>
nnoremap <leader>sv :exe 'source' expand(g:vimrc)<cr>
nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#
nnoremap <Space><Space> %

" To manipulate compiling
noremap <F1> :make<CR>
noremap <F2> :cp<CR>
noremap <F3> :cn<CR>
noremap <F4> :cwindow<CR>

" To comment
nnoremap <F5> gI//<Space><Esc>j^
" To uncomment
nnoremap <F6> gI<esc>3xj

" To indent
"inoremap <c-tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"function CGlobalIndent()
"  normal ==
"endfun

"nnoremap <F8> <Esc>:call CGlobalIndent()<CR>

" Paste
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" Change buffer
noremap <C-N> :bn<CR>
noremap <C-P> :bp<CR>

" Hide coloration of found words
nnoremap -- :nohlsearch<CR>

" Launch a new vim and quit one
"map <F9> :silent !gvim<CR>
"map <F10> :qa!<CR>
noremap <F9> :Dox<CR>
noremap <F10> :DoxHeader<CR>

" ?????
nnoremap <F12>   :exe "ptj ".expand("<cword>")<CR>
inoremap <F12>   :exe "ptj ".expand("<cword>")<CR>
nnoremap <S-F12> :exe "stj ".expand("<cword>")<CR>
inoremap <S-F12> :exe "stj ".expand("<cword>")<CR>
nnoremap <C-F12> :exe "tj ". expand("<cword>")<CR>
inoremap <C-F12> :exe "tj " .expand("<cword>")<CR>


" Builds a ctags database for omnicpp
noremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <silent> <Leader>z :%s/\s\+$//<CR>

" Use C-F12 to rebuild the tags database. You need ctags 5.6 or above.
" noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
inoremap <C-TAB> <C-V><C-TAB>







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                AutoCmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Settings [require autocmd]
if has("autocmd")
    " See ':h event' to get a list of valid autocmd events.

	" Remove ALL autocommands for the current group.
        "   autocmd! "seems to be a bad idea...

    " Use the last known position when reopening the file.
"    autocmd BufReadPost *
"                \ if line("'\"") > 1 && line("'\"") <= line("$") |
"                \	exe "normal! g`\"" |
"                \ endif
"
"
"    " commands depending on the extension of the opened file
"    autocmd BufReadPre /tmp/pico.*,mutt-* set filetype=mail
"    autocmd FileType css set smartindent
"    autocmd BufRead mutt-* set nobackup
"    autocmd FileType make set shiftwidth=8
"    autocmd FileType changelog set noexpandtab
"    autocmd BufEnter *.c,*.h set formatoptions=croql cpt=.,w,b,u,t,i,k~/.complete-c nowrap cindent smartindent
"    autocmd BufEnter *.y,*.yy set formatoptions=croql cpt=.,w,b,u,t,i,k~/.complete-yacc nowrap cindent smartindent
"    autocmd BufEnter *.l,*.ll set formatoptions=croql cpt=.,w,b,u,t,i,k~/.complete-lex nowrap cindent smartindent
"    autocmd BufEnter *.C,*.cpp,*.hh,*.cc,*.hxx set formatoptions=croql cpt=.,w,b,u,t,i,k~/.complete-cpp nowrap cindent smartindent
"    autocmd BufEnter *.java set formatoptions=croql cpt=.,w,b,u,t,i,k~/.complete-java nowrap cindent
"    autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit noet tw=76
"
"
"    autocmd BufEnter *.rb set formatoptions=croql cpt=.,w,b,u,t,i,k~/.complete-ruby comments=sr:#,mb:#,el:# nowrap cindent smartindent
"    autocmd BufEnter *.py set sw=4 sts=4 et ai cindent cinkeys=:,o,O
"    autocmd BufEnter *.htt set syntax=html
"    autocmd BufEnter *.mly set syntax=yacc
"    autocmd BufEnter *.m4 set formatoptions=croql cpt=.,w,b,u,t,i cindent smartindent tw=0 comments=sr:##,mb:##,el:##
"    autocmd BufEnter *.str,*.sdf set sw=2 comments=sr:/*,mb:*,el:*/ cpt=.,w,b,u,t,i smartindent textwidth=0
"    autocmd BufEnter Makefile,GNUmakefile set tabstop=8
"    autocmd BufReadPost quickfix set wrap
"
"
"    " Latex
"    autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=fr
"    autocmd BufEnter *.tex set cpt=.,w,b,u,t,i,k~/.complete-latex
"
"    " Read PDFs in ViM.
"    autocmd BufReadPre *.pdf set ro
"    autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
"
"    autocmd BufRead,BufNewFile,FileType mail setlocal spell spelllang=fr tw=72
"
"    " Coding Style...
"    if exists("use_epita_coding_style")
"        " format of the comments : Doxygen
"        autocmd BufEnter *.c,*.h,*.y,*.yy,*.l,*.ll,*.C,*.cpp,*.hh,*.cc,*.hxx,*.java set comments=sr:/**,mb:<sp>**,er:*/
"    endif
"

endif
" automatically delete trailing DOS-returns and trailing whitespaces
"  autocmd BufWritePre *.c,*.h,*.y,*.yy,*.l,*.ll,*.C,*.cpp,*.hh,*.cc,*.hxx,*.cxx,*.hpp,*.java,*.rb,*.py,*.m4,*.pl,*.pm silent! %s/[\r \t]\+$//






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                Required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" returns a <tab> or a <C-N> depending on the context
" start of line -> tab
" otherwise -> <C-N> (autocompletion)
" (c) benoit.cerrina@writeme.com tip#102 @ vim.org

"function InsertTabWrapper()
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  else
"    return "\<c-p>"
"  endif
"endfunction
