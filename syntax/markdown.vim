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

syn region markdownH1 matchgroup=markdownHeadingDelimiter start="^\s*#"      end="#*\s*$" keepend oneline
syn region markdownH2 matchgroup=markdownHeadingDelimiter start="^\s*##"     end="#*\s*$" keepend oneline
syn region markdownH3 matchgroup=markdownHeadingDelimiter start="^\s*###"    end="#*\s*$" keepend oneline
syn region markdownH4 matchgroup=markdownHeadingDelimiter start="^\s*####"   end="#*\s*$" keepend oneline
syn region markdownH5 matchgroup=markdownHeadingDelimiter start="^\s*#####"  end="#*\s*$" keepend oneline
syn region markdownH6 matchgroup=markdownHeadingDelimiter start="^\s*######" end="#*\s*$" keepend oneline

hi link markdownHeadingDelimiter        Delimiter
hi link markdownH1                      Title
hi link markdownH2                      Title
hi link markdownH3                      Title
hi link markdownH4                      Title
hi link markdownH5                      Title
hi link markdownH6                      Title

let b:current_syntax = "markdown"
