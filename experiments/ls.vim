syn clear

syn region lsInlineCode matchgroup=lsInlineCodeDelimiter start="`" end="`" keepend
syn cluster lsInline contains=lsInlineCode

" must be put *before* lsCodeBlock because if it's indented too much then it must become an lsCodeBlock
syn region lsFencedCodeBlock matchgroup=lsFencedCodeBlockDelimiter start=/^\s*```.*$/ end=/^\s*```\ze\s*$/

syn match lsCodeBlock /\%(^\n\)\@<=\%(\%( \{4,}\|\t\{1,}\).*\n\?\)\+$/

hi def link lsCodeBlock String
hi def link lsFencedCodeBlock String
hi def link lsFencedCodeBlockDelimiter Special
hi def link lsInlineCode Error
hi def link lsInlineCodeDelimiter Special


for s:level in range(0, 42)
  execute 'syn region lsListItemAtLevel' . s:level . ' '
    \ . 'matchgroup=lsItemDelimiter keepend '
    \ . 'contains='
    \ .   'lsCodeBlockInListItemAtLevel' . s:level . ','
    \ .   'lsFencedCodeBlockInListItemAtLevel' . s:level . ','
    \ .   'lsListItemAtLevel' . (s:level+1) . ','
    \ .   '@lsInline '
    \ . 'start=/^\%( \{' . 2*s:level . '}\|\t\{' . s:level . '}\)\*\s\+\S\@=/ '
    \ . 'end=/\n\%(\n\n\)\@=\|\n\%(\n\S\)\@=\|\n\%(\s*\*\s\+\S\)\@=/'

  execute 'syn match lsCodeBlockInListItemAtLevel' . s:level . ' '
    \ . 'contained '
    \ . '/\%(^\n\)\@<=\%(\%( \{' . (8+2*s:level)  . ',}\|\t\{' . (2+s:level) . ',}\).*\n\?\)\+$/'

  execute 'syn region lsFencedCodeBlockInListItemAtLevel' . s:level . ' '
    \ . 'contained '
    \ . 'matchgroup=lsFencedCodeBlockInItemDelimiter '
    \ . 'start=/^\z(\s\{' . (2+2*s:level) . ',' . (7+2*s:level) . '}\)*```.*$/ '
    \ . 'end=/^\z1*```\ze\s*$/'

  execute 'hi def link lsListItemAtLevel' . s:level . ' Statement'
  execute 'hi def link lsCodeBlockInListItemAtLevel' . s:level . ' String'
  execute 'hi def link lsFencedCodeBlockInListItemAtLevel' . s:level . ' String'
endfor

hi def link lsItemDelimiter Special
hi def link lsFencedCodeBlockInItemDelimiter Special
