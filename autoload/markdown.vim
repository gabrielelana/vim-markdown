
function! markdown#FoldLevelOfLine(lnum)
  let currentline = getline(a:lnum)
  let nextline = getline(a:lnum + 1)

  " an empty line is not going to change the indentation level
  if match(currentline, '^\s*$') >= 0
    return '='
  endif

  " folding lists
  if s:SyntaxGroupOfLineIs(a:lnum, '^markdownListItem')
    if s:SyntaxGroupOfLineIs(a:lnum - 1, '^markdownListItem')
      return 'a1'
    endif
    if s:SyntaxGroupOfLineIs(a:lnum + 1, '^markdownListItem')
      return 's1'
    endif
    return '='
  endif

  " we are not going to fold things inside list items, too hairy
  let is_inside_a_list_item = s:SyntaxGroupOfLineIs(a:lnum, '^markdownListItem')
  if is_inside_a_list_item
    return '='
  endif

  " folding atx headers
  if match(currentline, '^#\{1,6}\s') >= 0
    let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
    return '>' . header_level
  endif

  " folding fenced code blocks
  let next_line_syntax_group = synIDattr(synID(a:lnum + 1, 1, 1), 'name')
  if match(currentline, '^\s*```') >= 0
    if next_line_syntax_group ==# 'markdownFencedCodeBlock'
      return 'a1'
    endif
    return 's1'
  endif

  " folding code blocks
  let current_line_syntax_group = synIDattr(synID(a:lnum, 1, 1), 'name')
  let prev_line_syntax_group = synIDattr(synID(a:lnum - 1, 1, 1), 'name')
  if match(currentline, '^\s\{4,}') >= 0
    if current_line_syntax_group ==# 'markdownCodeBlock'
      if prev_line_syntax_group !=# 'markdownCodeBlock'
        return 'a1'
      endif
      if next_line_syntax_group !=# 'markdownCodeBlock'
        return 's1'
      endif
    endif
    return '='
  endif

  " folding setex headers
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

function! s:SyntaxGroupOfLineIs(lnum, pattern)
  let stack = synstack(a:lnum, a:cnum)
  if len(stack) > 0
    return synIDattr(stack[0], 'name') =~# a:pattern
  endif
  return 0
endfunction
