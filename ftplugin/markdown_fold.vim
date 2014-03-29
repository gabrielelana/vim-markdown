
function! MarkdownFolds(lnum)
  let is_inside_a_list_item = synIDattr(synstack(a:lnum, 1)[0], 'name') =~ '^markdownListItem'
  if is_inside_a_list_item
    return '='
  endif

  let currentline = getline(a:lnum)
  if match(currentline, '^#\{1,6}\s') >= 0
    let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
    return '>' . header_level
  endif

  let next_line_syntax_group = synIDattr(synID(a:lnum + 1, 1, 1), 'name')
  if match(currentline, '^\s*```') >= 0
    if next_line_syntax_group ==# 'markdownFencedCodeBlock'
      return 'a1'
    endif
    return 's1'
  endif

  let prev_line_syntax_group = synIDattr(synID(a:lnum - 1, 1, 1), 'name')
  if match(currentline, '^\s\{4,}') >= 0
    if prev_line_syntax_group !=# 'markdownCodeBlock'
      return 'a1'
    endif
    if next_line_syntax_group !=# 'markdownCodeBlock'
      return 's1'
    endif
    return '='
  endif

  let nextline = getline(a:lnum + 1)
  if (match(currentline, '^.*$') >= 0)
    if (match(nextline, '^=\+$') >= 0)
      return '>1'
    endif
    if (match(nextline, '^-\+$') >= 0)
      return '>2'
    endif
  endif

  return '='
endfunction

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds(v:lnum)

" function! MarkdownFoldText()
"   let foldsize = (v:foldend-v:foldstart)
"   return getline(v:foldstart).' ('.foldsize.' lines)'
" endfunction
" setlocal foldtext=MarkdownFoldText()
