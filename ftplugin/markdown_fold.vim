
function! MarkdownFolds()
  let currentline = getline(v:lnum)
  if match(currentline, '^#\{1,6}') >= 0
    let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
    return '>' . header_level
  endif

  let nextline = getline(v:lnum + 1)
  let current_line_syntax_group = synIDattr(synID(v:lnum, 1, 1), 'name')
  let next_line_syntax_group = synIDattr(synID(v:lnum + 1, 1, 1), 'name')
  let prev_line_syntax_group = synIDattr(synID(v:lnum - 1, 1, 1), 'name')

  if match(currentline, '^\s*```') >= 0
    if next_line_syntax_group ==# 'markdownFencedCodeBlock'
      return 'a1'
    endif
    return 's1'
  endif

  if match(currentline, '^\s\{4,}') >= 0
    if prev_line_syntax_group !=# 'markdownCodeBlock'
      return 'a1'
    endif
    if next_line_syntax_group !=# 'markdownCodeBlock'
      return 's1'
    endif
    return '='
  endif

  if (match(currentline, '^.*$') >= 0)
    if (match(nextline, '^=\+$') >= 0)
      return '>1'
    endif
    if (match(nextline, '^-\+$') >= 0)
      return '>2'
    endif
  endif

  return "="
endfunction

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()

" function! MarkdownFoldText()
"   let foldsize = (v:foldend-v:foldstart)
"   return getline(v:foldstart).' ('.foldsize.' lines)'
" endfunction
" setlocal foldtext=MarkdownFoldText()
