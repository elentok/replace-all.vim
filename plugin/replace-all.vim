" Variables {{{1
let g:find_all_plugin_root = expand('<sfile>:p:h') . '/..'

if !exists("g:find_all_key")
  let g:find_all_key = '<Leader>fr'
end

" Functions {{{1

func! FindAll(args)
  silent exec "!" . g:find_all_plugin_root . "/bin/find-all " . a:args
  split /tmp/results.replace-all
  redraw!

  let query = substitute(a:args, " *-G.*$", "", "")
  let query = substitute(query, "^'", "", "")
  let query = substitute(query, "'$", "", "")
  let @/ = query
  normal ggn
endfunc


func! ReplaceAll(args)
  write
  exec "!" . g:find_all_plugin_root . "/bin/replace-all " . a:args
endfunc

func! ReplaceAll_EscapeForQuery(text)
  let text = substitute(a:text, '\v(\[|\]|\$|\^)', '\\\1', 'g')
  let text = substitute(text, "'", "''", 'g')
  return text
endfunc

func! ReplaceAll_EscapeRegisterForQuery(register)
  return ReplaceAll_EscapeForQuery(getreg(a:register))
endfunc

" Commands {{{1

command! -range -nargs=+ FindAll call FindAll("<args>")
command! -nargs=* ReplaceAll call ReplaceAll("<args>")

" Key Mappings {{{1

exec 'noremap ' . g:find_all_key .
  \ ' :FindAll <c-r>=ReplaceAll_EscapeForQuery(expand("<cword>"))<cr>'
exec 'vnoremap ' . g:find_all_key .
  \  ' "9y:FindAll <c-r>=ReplaceAll_EscapeRegisterForQuery(9)<cr><cr>'

" vim: foldmethod=marker
