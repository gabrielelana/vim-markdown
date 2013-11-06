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

syn match markdownHeadingUnderline "^[=-]\+$" contained
syn match markdownH1 "^.\+\n=\+$" contains=markdownHeadingUnderline
syn match markdownH2 "^.\+\n-\+$" contains=markdownHeadingUnderline

syn match markdownBlockquoteDelimiter "^\%(\s\|>\)\+" contained
syn match markdownBlockquote "^\s*>\%(.\+\n\)\+\n*" contains=markdownBlockquoteDelimiter

syn region markdownItalic matchgroup=markdownInlineDelimiter start="\%(\s\|^\)\@<=\*\%(\*\)\@!" end="\*\%(\s\|$\)\@=" oneline keepend 
syn region markdownItalic matchgroup=markdownInlineDelimiter start="\%(\s\|^\)\@<=_\%(_\)\@!" end="_\%(\s\|$\)\@=" oneline keepend 
syn region markdownBold matchgroup=markdownInlineDelimiter start="\%(\s\|^\)\@<=\*\*\%(\*\)\@!" end="\*\*\%(\s\|$\)\@=" oneline keepend
syn region markdownBold matchgroup=markdownInlineDelimiter start="\%(\s\|^\)\@<=__\%(_\)\@!" end="__\%(\s\|$\)\@=" oneline keepend 
syn region markdownBoldItalic matchgroup=markdownInlineDelimiter start="\%(\s\|^\)\@<=\*\*\*\%(\*\)\@!" end="\*\*\*\%(\s\|$\)\@=" oneline keepend
syn region markdownBoldItalic matchgroup=markdownInlineDelimiter start="\%(\s\|^\)\@<=___\%(_\)\@!" end="___\%(\s\|$\)\@=" oneline keepend 

syn cluster markdownInline contains=markdownItalic,markdownBold,markdownBoldItalic

hi def Italic                       term=italic cterm=italic gui=italic
hi def Bold                         term=bold cterm=bold gui=bold
hi def BoldItalic                   term=bold,italic cterm=bold,italic gui=bold,italic

hi def link markdownItalic                  Italic
hi def link markdownBold                    Bold
hi def link markdownBoldItalic              BoldItalic

hi def link markdownBlockquote              Comment
hi def link markdownBlockquoteDelimiter     Delimiter
hi def link markdownHeadingDelimiter        Delimiter
hi def link markdownHeadingUnderline        Delimiter
hi def link markdownInlineDelimiter         Delimiter
hi def link markdownH1                      Title
hi def link markdownH2                      Title
hi def link markdownH3                      Title
hi def link markdownH4                      Title
hi def link markdownH5                      Title
hi def link markdownH6                      Title

let b:current_syntax = "markdown"
