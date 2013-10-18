let g:find_all_plugin_root = expand('<sfile>:p:h') . '/..'

func! FindAll(args)
  silent exec "!" . g:find_all_plugin_root . "/bin/find-all " . a:args
  split /tmp/results.replace-all
  redraw!

  let query = substitute(a:args, " *-G.*$", "", "")
  let @/ = query
  normal ggn
endfunc

command! -nargs=+ FindAll call FindAll("<args>")

func! ReplaceAll(args)
  write
  silent exec "!" . g:find_all_plugin_root . "/bin/replace-all " . a:args
  redraw!
endfunc

command! -nargs=* ReplaceAll call ReplaceAll("<args>")