let b:markdown_in_jekyll=0

if getline(1) =~ '^---\s*$'
  let b:markdown_in_jekyll=1

  syn region markdownJekyllFrontMatter matchgroup=markdownJekyllDelimiter contains=@NoSpell
    \ start="\%^---" end="^---$"

  syn region markdownJekyllLiquidTag matchgroup=markdownJekyllDelimiter contains=@NoSpell oneline
    \ start="{%" end="%}"

  syn region markdownJekyllLiquidOutputTag matchgroup=markdownJekyllDelimiter contains=@NoSpell oneline
    \ start="{{" skip=/"}}"/ end="}}"

  syn region markdownJekyllLiquidBlockTag matchgroup=markdownJekyllDelimiter contains=@NoSpell
    \ start="{%\s*\z(comment\|raw\)\s*%}" end="{%\s*no\z1\s*%}"

  silent spell! nocomment
  silent spell! noraw

  hi def link markdownJekyllFrontMatter         NonText
  hi def link markdownJekyllLiquidTag           NonText
  hi def link markdownJekyllLiquidOutputTag     NonText
  hi def link markdownJekyllLiquidBlockTag      NonText
  hi def link markdownJekyllDelimiter           Delimiter
endif
