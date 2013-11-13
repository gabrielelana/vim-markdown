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

syn region markdownH1 matchgroup=markdownHeadingDelimiter start="^#"      end="#*\s*$" oneline contains=@markdownInline
syn region markdownH2 matchgroup=markdownHeadingDelimiter start="^##"     end="#*\s*$" oneline contains=@markdownInline
syn region markdownH3 matchgroup=markdownHeadingDelimiter start="^###"    end="#*\s*$" oneline contains=@markdownInline
syn region markdownH4 matchgroup=markdownHeadingDelimiter start="^####"   end="#*\s*$" oneline contains=@markdownInline
syn region markdownH5 matchgroup=markdownHeadingDelimiter start="^#####"  end="#*\s*$" oneline contains=@markdownInline
syn region markdownH6 matchgroup=markdownHeadingDelimiter start="^######" end="#*\s*$" oneline contains=@markdownInline

syn match markdownHeadingUnderline "^[=-]\+$" contained
syn match markdownH1 "^.\+\n=\+$" contains=@markdownInline,markdownHeadingUnderline
syn match markdownH2 "^.\+\n-\+$" contains=@markdownInline,markdownHeadingUnderline

syn match markdownUnorderedListDelimiter "\%(\t\| \{0,4\}\)\+[-*+]\%(\s\+\)\@="

syn match markdownBlockquoteDelimiter "^\%(\s\|>\)\+" contained
syn match markdownBlockquote "^\s*>\%(.\+\n\)\+\n*" contains=markdownBlockquoteDelimiter

syn region markdownItalic matchgroup=markdownInlineDelimiter start="\%(\s\|_\|^\)\@<=\*\%(\s\|\*\|$\)\@!" end="\%(\s\|\*\)\@<!\*" contains=markdownItalic
syn region markdownItalic matchgroup=markdownInlineDelimiter start="\%(\s\|\*\|^\)\@<=_\%(\s\|_\|$\)\@!" end="\%(\s\|_\)\@<!_" contains=markdownItalic
syn region markdownBold matchgroup=markdownInlineDelimiter start="\%(\s\|__\|^\)\@<=\*\*\%(\s\|\*\|$\)\@!" end="\%(\s\|\*\*\)\@<!\*\*" contains=markdownBold
syn region markdownBold matchgroup=markdownInlineDelimiter start="\%(\s\|\*\*\|^\)\@<=__\%(\s\|_\|$\)\@!" end="\%(\s\|__\)\@<!__" contains=markdownBold

syn region markdownBoldItalic matchgroup=markdownInlineDelimiter start="\%(\s\|_\|^\)\@<=\*\*\*\%(\s\|\*\|$\)\@!" end="\%(\s\|\*\)\@<!\*\*\*"
syn region markdownBoldItalic matchgroup=markdownInlineDelimiter start="\%(\s\|\*\|^\)\@<=___\%(\s\|_\|$\)\@!" end="\%(\s\|_\)\@<!___"
syn region markdownBoldItalic matchgroup=markdownInlineDelimiter start="\%(\s\|_\|^\)\@<=\*\*_\%(\s\|_\|$\)\@!" end="\%(\s\|_\)\@<!_\*\*"
syn region markdownBoldItalic matchgroup=markdownInlineDelimiter start="\%(\s\|\*\|^\)\@<=__\*\%(\s\|\*\|$\)\@!" end="\%(\s\|\*\)\@<!\*__"

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
hi def link markdownUnorderedListDelimiter  Delimiter
hi def link markdownH1                      Title
hi def link markdownH2                      Title
hi def link markdownH3                      Title
hi def link markdownH4                      Title
hi def link markdownH5                      Title
hi def link markdownH6                      Title

let b:current_syntax = "markdown"
