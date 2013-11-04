" Vim syntax file
" Language:     Markdown
" Maintainer:   Gabriele Lana <gabriele.lana@gmail.com>
" Filenames:    *.markdown

if exists("b:current_syntax")
  finish
endif

syn spell toplevel
syn sync minlines=10
syn case ignore

syn region markdownH1 matchgroup=markdownHeadingDelimiter start="^\s*#"      end="#*\s*$" oneline
syn region markdownH2 matchgroup=markdownHeadingDelimiter start="^\s*##"     end="#*\s*$" oneline
syn region markdownH3 matchgroup=markdownHeadingDelimiter start="^\s*###"    end="#*\s*$" oneline
syn region markdownH4 matchgroup=markdownHeadingDelimiter start="^\s*####"   end="#*\s*$" oneline
syn region markdownH5 matchgroup=markdownHeadingDelimiter start="^\s*#####"  end="#*\s*$" oneline
syn region markdownH6 matchgroup=markdownHeadingDelimiter start="^\s*######" end="#*\s*$" oneline

syn match markdownH1 "^.\+\n=\+$" contains=markdownHeadingUnderline
syn match markdownH2 "^.\+\n-\+$" contains=markdownHeadingUnderline
syn match markdownHeadingUnderline "^[=-]\+$" contained

syn match markdownBlockquote "^\s*>\%(.\+\n\)\+\n*" contains=markdownBlockquoteDelimiter
syn match markdownBlockquoteDelimiter "^\%(\s\|>\)\+" contained

syn cluster markdownDelimiters contains=markdownHeadingDelimiter,markdownBlockquoteDelimiter,markdownHeadingUnderline


hi link markdownBlockquote              Comment
hi link markdownDelimiters              Delimiter
hi link markdownH1                      Title
hi link markdownH2                      Title
hi link markdownH3                      Title
hi link markdownH4                      Title
hi link markdownH5                      Title
hi link markdownH6                      Title

let b:current_syntax = "markdown"
