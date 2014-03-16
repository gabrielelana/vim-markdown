syn clear
syn spell toplevel
syn sync minlines=342
syn case ignore

syn region lsInlineCode matchgroup=lsInlineCodeDelimiter start="`" end="`" keepend
syn cluster lsInline contains=lsInlineCode

syn region lsH1 matchgroup=lsHeadingDelimiter start=/^#/      end=/#*\s*$/ display oneline contains=@lsInline
syn region lsH2 matchgroup=lsHeadingDelimiter start=/^##/     end=/#*\s*$/ display oneline contains=@lsInline
syn region lsH3 matchgroup=lsHeadingDelimiter start=/^###/    end=/#*\s*$/ display oneline contains=@lsInline
syn region lsH4 matchgroup=lsHeadingDelimiter start=/^####/   end=/#*\s*$/ display oneline contains=@lsInline
syn region lsH5 matchgroup=lsHeadingDelimiter start=/^#####/  end=/#*\s*$/ display oneline contains=@lsInline
syn region lsH6 matchgroup=lsHeadingDelimiter start=/^######/ end=/#*\s*$/ display oneline contains=@lsInline
syn match lsH1 /^.\+\n=\+$/ display contains=@lsInline,lsHeadingDelimiter
syn match lsH2 /^.\+\n-\+$/ display contains=@lsInline,lsHeadingDelimiter
syn match lsHeadingDelimiter /^[=-]\+$/ display contained

" must be put *before* lsCodeBlock because if it's indented too much then it must become an lsCodeBlock
syn region lsFencedCodeBlock matchgroup=lsFencedCodeBlockDelimiter start=/^\s*```.*$/ end=/^\s*```\ze\s*$/

syn match lsCodeBlock /\%(^\n\)\@<=\%(\%( \{4,}\|\t\{1,}\).*\n\?\)\+$/

hi def link lsCodeBlock String
hi def link lsFencedCodeBlock String
hi def link lsFencedCodeBlockDelimiter Special
hi def link lsInlineCode Error
hi def link lsInlineCodeDelimiter Special

hi def link lsHeadingDelimiter Special
hi def link lsH1 Title
hi def link lsH2 Title
hi def link lsH3 Title
hi def link lsH4 Title
hi def link lsH5 Title
hi def link lsH6 Title


for s:level in range(1, 42)
  execute 'syn region lsListItemAtLevel' . (s:level) . ' '
    \ . 'matchgroup=lsItemDelimiter keepend '
    \ . 'contains='
    \ .   'lsCodeBlockInListItemAtLevel' . (s:level) . ','
    \ .   'lsFencedCodeBlockInListItemAtLevel' . (s:level) . ','
    \ .   'lsH1InListItemAtLevel' . (s:level) . ','
    \ .   'lsH2InListItemAtLevel' . (s:level) . ','
    \ .   'lsH3InListItemAtLevel' . (s:level) . ','
    \ .   'lsH4InListItemAtLevel' . (s:level) . ','
    \ .   'lsH5InListItemAtLevel' . (s:level) . ','
    \ .   'lsH6InListItemAtLevel' . (s:level) . ','
    \ .   'lsListItemAtLevel' . (s:level+1) . ','
    \ .   '@lsInline '
    \ . 'start=/^\%( \{' . (2*(s:level-1)) . '}\|\t\{' . (s:level-1) . '}\)\%([-*+]\|\d\.\)\s\+\S\@=/ '
    \ . 'end=/\n\%(\n\n\)\@=\|\n\%(\n\S\)\@=\|\n\%(\s*\%([-*+]\|\d\.\)\s\+\S\)\@=/'

  execute 'syn match lsCodeBlockInListItemAtLevel' . (s:level) . ' '
    \ . 'contained '
    \ . '/\%(^\n\)\@<=\%(\%( \{' . (6+2*s:level)  . ',}\|\t\{' . (1+s:level) . ',}\).*\n\?\)\+$/'

  " TODO: move before lsCodeBlockInListItemAtLevel and constain only minimum
  " of spaces (ad also tabs)
  execute 'syn region lsFencedCodeBlockInListItemAtLevel' . (s:level) . ' '
    \ . 'contained '
    \ . 'matchgroup=lsFencedCodeBlockInItemDelimiter '
    \ . 'start=/^\z(\s\{' . (2*s:level) . ',' . (5+2*s:level) . '}\)*```.*$/ '
    \ . 'end=/^\z1*```\ze\s*$/'

  execute 'syn region lsH1InListItemAtLevel' . (s:level) . ' '
    \ . 'contained display oneline '
    \ . 'matchgroup=lsHeadingDelimiter '
    \ . 'contains=@lsInline '
    \ . 'start=/\%(^\n\)\@<=\%( \{' . (2*s:level) . '}\|\t\{' . (s:level) . '}\)#\%(\s\+\)\@=/ '
    \ . 'end=/#*\s*$/'
  execute 'syn region lsH2InListItemAtLevel' . (s:level) . ' '
    \ . 'contained display oneline '
    \ . 'matchgroup=lsHeadingDelimiter '
    \ . 'contains=@lsInline '
    \ . 'start=/\%(^\n\)\@<=\%( \{' . (2*s:level) . '}\|\t\{' . (s:level) . '}\)##\%(\s\+\)\@=/ '
    \ . 'end=/#*\s*$/'
  execute 'syn region lsH3InListItemAtLevel' . (s:level) . ' '
    \ . 'contained display oneline '
    \ . 'matchgroup=lsHeadingDelimiter '
    \ . 'contains=@lsInline '
    \ . 'start=/\%(^\n\)\@<=\%( \{' . (2*s:level) . '}\|\t\{' . (s:level) . '}\)###\%(\s\+\)\@=/ '
    \ . 'end=/#*\s*$/'
  execute 'syn region lsH4InListItemAtLevel' . (s:level) . ' '
    \ . 'contained display oneline '
    \ . 'matchgroup=lsHeadingDelimiter '
    \ . 'contains=@lsInline '
    \ . 'start=/\%(^\n\)\@<=\%( \{' . (2*s:level) . '}\|\t\{' . (s:level) . '}\)####\%(\s\+\)\@=/ '
    \ . 'end=/#*\s*$/'
  execute 'syn region lsH5InListItemAtLevel' . (s:level) . ' '
    \ . 'contained display oneline '
    \ . 'matchgroup=lsHeadingDelimiter '
    \ . 'contains=@lsInline '
    \ . 'start=/\%(^\n\)\@<=\%( \{' . (2*s:level) . '}\|\t\{' . (s:level) . '}\)#####\%(\s\+\)\@=/ '
    \ . 'end=/#*\s*$/'
  execute 'syn region lsH6InListItemAtLevel' . (s:level) . ' '
    \ . 'contained display oneline '
    \ . 'matchgroup=lsHeadingDelimiter '
    \ . 'contains=@lsInline '
    \ . 'start=/\%(^\n\)\@<=\%( \{' . (2*s:level) . '}\|\t\{' . (s:level) . '}\)######\%(\s\+\)\@=/ '
    \ . 'end=/#*\s*$/'

" syn match lsH1 /^.\+\n=\+$/ display contains=@lsInline,lsHeadingDelimiter
" syn match lsH2 /^.\+\n-\+$/ display contains=@lsInline,lsHeadingDelimiter
" syn match lsHeadingDelimiter /^[=-]\+$/ display contained

  execute 'hi def link lsListItemAtLevel' . (s:level) . ' Statement'
  execute 'hi def link lsCodeBlockInListItemAtLevel' . (s:level) . ' String'
  execute 'hi def link lsFencedCodeBlockInListItemAtLevel' . (s:level) . ' String'
  execute 'hi def link lsH1InListItemAtLevel' . (s:level) . ' Title'
  execute 'hi def link lsH2InListItemAtLevel' . (s:level) . ' Title'
  execute 'hi def link lsH3InListItemAtLevel' . (s:level) . ' Title'
  execute 'hi def link lsH4InListItemAtLevel' . (s:level) . ' Title'
  execute 'hi def link lsH5InListItemAtLevel' . (s:level) . ' Title'
  execute 'hi def link lsH6InListItemAtLevel' . (s:level) . ' Title'
endfor

hi def link lsItemDelimiter Special
hi def link lsFencedCodeBlockInItemDelimiter Special
