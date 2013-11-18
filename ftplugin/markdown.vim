if exists("b:did_ftplugin")
  finish
endif

setlocal textwidth=0
setlocal ts=2 sw=2 expandtab smarttab
setlocal comments=b:*,b:-,b:+,n:> commentstring=>\ %s
setlocal formatoptions+=tcrqon formatoptions-=wa

function! s:MarkdownJumpToHeader(forward, visual)
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

function! s:MarkdownIndentListItem(indent)
  let line = getline('.')
  if line =~ '\v^\s*\*\s*$'
    if a:indent
      normal >>
    else
      normal <<
    endif
    call setline('.', substitute(getline('.'), '\*\s*$', '* ', ''))
  else 
    call setline('.', substitute(line, '$', "\t", ''))
  endif
endfunction

noremap <silent> <buffer> <script> ]] :call <SID>MarkdownJumpToHeader(1, 0)<CR>
noremap <silent> <buffer> <script> [[ :call <SID>MarkdownJumpToHeader(0, 0)<CR>
vnoremap <silent> <buffer> <script> ]] :<C-u>call <SID>MarkdownJumpToHeader(1, 1)<CR>
vnoremap <silent> <buffer> <script> [[ :<C-u>call <SID>MarkdownJumpToHeader(0, 1)<CR>

noremap <silent> <buffer> <script> ][ <nop>
noremap <silent> <buffer> <script> [] <nop>

inoremap <silent> <buffer> <Tab> <Esc>:call <SID>MarkdownIndentListItem(1)<CR>A
inoremap <silent> <buffer> <S-Tab> <Esc>:call <SID>MarkdownIndentListItem(0)<CR>A

let b:did_ftplugin = 1
