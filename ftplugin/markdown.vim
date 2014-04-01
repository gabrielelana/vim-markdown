if exists('b:did_ftplugin') | finish | endif

" {{{ OPTIONS

setlocal textwidth=0
setlocal ts=2 sw=2 expandtab smarttab
setlocal comments=b:*,b:-,b:+,n:> commentstring=>\ %s
setlocal formatoptions+=tcrqon formatoptions-=wa
setlocal formatlistpat="^\s*\d\.\s\+"

" enable spelling and completion based on dictionary words
if &spelllang !~# '^\s*$'
  setlocal spell
endif

" custom dictionary for emoji
execute 'setlocal dictionary+=' . expand('<sfile>:p:h:h') . '/dict/emoticons.dict'
setlocal iskeyword+=:,+,-
setlocal complete+=k

" replace common ascii emoticons with supported emoji
iabbrev <buffer> :-) :smile:
iabbrev <buffer> :-D :laughing:
iabbrev <buffer> :-( :disappointed:

" replace common punctuation
iabbrev <buffer> ... …
iabbrev <buffer> << «
iabbrev <buffer> >> »

" }}}


" {{{ FUNCTIONS

function! s:JumpToHeader(forward, visual)
  let pattern = '\v^#{1,6}.*$|^.+\n%(\-+|\=+)$'
  if a:visual
    normal! gv
  endif
  if a:forward
    let direction = '/'
  else
    let direction = '?'
  endif
  execute 'silent normal! ' . direction . pattern . "\n"
endfunction

function! s:Indent(indent)
  if getline('.') =~ '\v^\s*%([-*+]|\d\.)\s*$'
    if a:indent
      normal >>
    else
      call setline('.', substitute(getline('.'), '^\*\s*$', '', ''))
      normal <<
    endif
    call setline('.', substitute(getline('.'), '\*\s*$', '* ', ''))
    normal $
  elseif getline('.') =~ '\v^\s*(\s?\>)+\s*$'
    if a:indent
      call setline('.', substitute(getline('.'), '>\s*$', '>> ', ''))
    else
      call setline('.', substitute(getline('.'), '\s*>\s*$', ' ', ''))
      call setline('.', substitute(getline('.'), '^\s\+$', '', ''))
    endif
    normal $
  endif
endfunction

function! s:IsAnEmptyListItem()
  return getline('.') =~ '\v^\s*%([-*+]|\d\.)\s*$'
endfunction

function! s:IsAnEmptyQuote()
  return getline('.') =~ '\v^\s*(\s?\>)+\s*$'
endfunction

" }}}


" {{{ MAPPINGS

" Jumping around
noremap <silent> <buffer> <script> ]] :call <SID>JumpToHeader(1, 0)<CR>
noremap <silent> <buffer> <script> [[ :call <SID>JumpToHeader(0, 0)<CR>
vnoremap <silent> <buffer> <script> ]] :<C-u>call <SID>JumpToHeader(1, 1)<CR>
vnoremap <silent> <buffer> <script> [[ :<C-u>call <SID>JumpToHeader(0, 1)<CR>
noremap <silent> <buffer> <script> ][ <nop>
noremap <silent> <buffer> <script> [] <nop>

" Indenting things
inoremap <silent> <buffer> <script> <expr> <Tab>
  \ <SID>IsAnEmptyListItem() \|\| <SID>IsAnEmptyQuote() ? '<C-O>:call <SID>Indent(1)<CR>' : '<Tab>'
inoremap <silent> <buffer> <script> <expr> <S-Tab>
  \ <SID>IsAnEmptyListItem() \|\| <SID>IsAnEmptyQuote() ? '<C-O>:call <SID>Indent(0)<CR>' : '<Tab>'

" Remove empty list items when press <CR> and the list item is empty
inoremap <silent> <buffer> <script> <expr> <CR> <SID>IsAnEmptyListItem() ? '<C-O>:normal 0D<CR>' : '<CR>'

" }}}

let b:did_ftplugin = 1
