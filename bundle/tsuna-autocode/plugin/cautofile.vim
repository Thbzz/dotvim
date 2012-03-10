""
"" cautofile.vim for vim in /u/a1/sigour_b/.vim/plugins
""
"" Made by SIGOURE Benoit
"" Login <sigour_b@epita.fr>
""
"" Started on Fri Feb 24 23:26:58 2006 SIGOURE Benoit
"" Last update Fri 02 Dec 2011 10:18:39 PM CET hartma_t
""

" original author: unknown
" To make automatikely the files

if exists("$FULLNAME")
  let mename = $FULLNAME
else
  let mename = $USER
endif

if exists("$EMAIL")
  let memail = $EMAIL
else
  " FIXME
  let memail = $USER . "@epita.fr"
endif

if exists("$NO_STRICT_EPITA_HEADERS")
  let meloginstring = "Mail"
else
  let meloginstring = "Login"
endif

if has("autocmd")

    let $VIMHOME=expand('<sfile>:p:h:h')

  aug coding
    au BufNewFile *.c call CFile_New()
    au BufNewFile *.h call HFile_New()
    au BufNewFile *.cc call CFile_New()
    au BufNewFile *.hh call HFile_New()
    au BufNewFile *.hxx call HFile_New()
    au BufNewFile *.hcc call HFile_New()
    au BufNewFile *.ti[gh] call CFile_New()
    au BufNewFile *.sh call SHFile_New()
    au BufNewFile configure.* call SHARPFile_New()
    au BufNewFile configure call SHFile_New()
    au BufNewFile bootstrap call SHFile_New()
    au BufNewFile .bash* call SHFile_New()
    au BufNewFile .zsh* call SHFile_New()
    au BufNewFile *.rb call RUBYFile_New()
    au BufNewFile *.sed call SEDFile_New()
    au BufNewFile *.vim call VIMFile_New()
    au BufNewFile *.aasm call AASMFile_New()
    au BufNewFile ?akefile.* call SHARPFile_New()
    au BufNewFile ?akefile call CMakefile_New()
    au BufNewFile *.m4 call SHARPFile_New()

    au BufWritePre *.[ch] call CUpdate_Headers()
"" au BufWritePre *.cc call CUpdate_Headers()
    au BufWritePre *.cc call CSSeCpp()
    au BufWritePre *.hh call CSSeCpp()
    au BufWritePre *.hxx call CSSeCpp()
"" au BufWritePre *.hh call CUpdate_Headers()
"" au BufWritePre *.hxx call CUpdate_Headers()
    au BufWritePre *.hcc call CUpdate_Headers()
    au BufWritePre *.hcc call CUpdate_Headers()
    au BufWritePre *.ti[gh] call CUpdate_Headers()
    au BufWritePre *.sh call SHUpdate_Headers()
    au BufWritePre configure* call SHUpdate_Headers()
    au BufWritePre bootstrap call SHUpdate_Headers()
    au BufWritePre .bash* call SHUpdate_Headers()
    au BufWritePre .zsh* call SHUpdate_Headers()
    au BufWritePre *.rb call SHUpdate_Headers()
    au BufWritePre *.sed call SHUpdate_Headers()
    au BufWritePre *.pl call SHUpdate_Headers()
"" au BufWritePre *.vim call CUpdate_Headers()
    au BufWritePre *.aasm call CUpdate_Headers()
"" au BufWritePre ?akefile* call CUpdate_Headers()
    au BufWritePre *.m4 call CUpdate_Headers()
  aug END

  function CSSeCpp()
      "" removes trailing whitespaces
      execute "% s,\\s\\+$,,e"
      "" set one space before parenthesis
      execute "% s,\\([^(]\\)\\s*(,\\1 (,e"
      "" removes whitespaces between opening parents
      execute "% s,(\\s*(,((,e"
      "" removes double whitespaces
      execute "% s,\\(\\S\\)\\s\\s\\+\\(\\S\\),\\1 \\2,eg"
  endfun

  function ReplaceFields(cs, cm, ce)
    execute "% s,@CS@," . a:cs . ",ge"
    execute "% s,@CM@," . a:cm . ",ge"
    execute "% s,@CE@," . a:ce . ",ge"
    execute "% s,@FILE-NAME@," . expand('%:t') . ",ge"
    execute "% s,@LOGIN-STRING@," . g:meloginstring . ",ge"
    execute "% s,@USER-MAIL@," . g:memail . ",ge"
    execute "% s,@USER-NAME@," . g:mename . ",ge"
    execute "% s/@DATE-STAMP@/" . strftime("%c") . "/ge"
    execute "% s,@PWD@," . $PWD . ",ge"
  endfun

  function CFile_New()
    0r $VIMHOME/c.tpl
    call ReplaceFields('/*', '**', '*/')
    execute "2"
    normal 5w
  endfun

  function RUBYFile_New()
    0r $VIMHOME/skel/ruby.tpl
    call ReplaceFields('##', '##', '##')
    execute "3"
    normal 5w
  endfun

  function SEDFile_New()
    0r $VIMHOME/skel/sed.tpl
    call ReplaceFields('##', '##', '##')
    execute "3"
    normal 5w
  endfun

  function SHARPFile_New()
    0r $VIMHOME/skel/vim.tpl
    call ReplaceFields('##', '##', '##')
    execute "2"
    normal 5w
  endfun

  function VIMFile_New()
    0r $VIMHOME/skel/vim.tpl
    call ReplaceFields('""', '""', '""')
    execute "2"
    normal 5w
  endfun

  function SHFile_New()
    0r $VIMHOME/skel/sh.tpl
    call ReplaceFields('##', '##', '##')
    execute "3"
    normal 5w
  endfun

  function HFile_New()
    0r $VIMHOME/skel/c.tpl
    normal G
    r $VIMHOME/skel/h.tpl
    call ReplaceFields('/*', '**', '*/')
    execute "12"
    normal 2wgU$g$bbr_
    execute "13"
    normal 2wgU$g$bbr_
    execute "14"
    normal 4wgU$g$bbbr_
    execute "2"
    normal 5w
  endfun

  function CMakefile_New()
    0r $VIMHOME/skel/c.tpl
    call ReplaceFields('#', '#', '#')
    normal Gdh
    r ~/.vim/skel/makefile.tpl
  endfun

  function AASMFile_New()
    0r $VIMHOME/skel/aasm.tpl
    call ReplaceFields(';;', ';;', ';;')
    execute "2"
    normal 5w
  endfun

  function CUpdate_Headers()
    normal mS
    execute "1,8 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:mename . ",e"
    normal `S
    call CSSeCpp()
  endfun

  function SHUpdate_Headers()
    normal mS
    execute "1,9 s,\\(Last update \\).*,\\1" . strftime("%c") . " " . g:mename . ",e"
    normal `S
  endfun

endif
