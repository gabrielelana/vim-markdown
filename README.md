# Vim Github Markdown Support
... This is not ready by any means to be used, stay tuned :-)


# Highlights
* Strong support for the Markdown flavour implemented by Github: what you see in Vim is what you get on Github (fenced code blocks, tables, check lists, emoji, ...)
* Detects Jekyll files and automatically adds support for Liquid template engine and other goodies


# Why?
I wanted a strong support for the markdown flavour implemented by Github, I wanted a syntax highlight that would mirror the result I would find later on Github, I wanted a syntax highlight that would not break easily, I wanted a syntax highlight that I could rely on (aka rapid feedback), I wanted something more that a mere syntax highlight. The [Markdown Syntax](http://daringfireball.net/projects/markdown/syntax) unfortunately it's so loosely defined that there are *flavours* of markdown that are subtly incompatible from each other, the [Markdown supported by Github](https://help.github.com/articles/github-flavored-markdown) is one of them.


# Development
## Resources
* [Markdown Github Syntax](https://help.github.com/articles/github-flavored-markdown)
* [Markdown Github API](http://developer.github.com/v3/markdown)
* [Markdown Github Quick Preview](http://github-markdown-preview.heroku.com/)

## Syntax Specs
Testing syntax highlight could be tricky, here I use the golden master patter to at least avoid regressions, this is how it works: in `./rspec/features` you will find a bunch of `*.md` files, one for each syntactic element supported, for each of those files there's an html file, this file is created with the `:TOhtml` command and it's the reference (aka golden master) of the syntax highlight of the original file. Running `rspec` you are comparing the current syntax highlight of all the feature's file with the reference syntax highlight. If looking at some of the feature's file you see something wrong you can fix it and after regenerate the golden master files with `GENERATE_GOLDEN_MASTER=1 rspec`


# Documentation
I would use this section until I have a proper documentation for this plugin

## Configuration
* `let g:markdown_include_jekyll_support = 1` to load support to Jekyll files (default: 1)
* `let g:markdown_include_default_mappings = 1` to load default mappings (default: 0)

## Default Mappings
All default mappings are local to markdown buffers
* `NORMAL_MODE` `<Leader>e` edit the current code block in another buffer with a guessed file type
* `VISUAL_MODE` `<Leader>e` edit the visual block in another buffer with markdown file type

## Motions
* `]]` start of the next header
* `[[` start of the previous header

## Editing
* `i_<Tab>`/`i_<S-Tab>` on a list item it will indent/unindent the item
* `i_<Tab>`/`i_<S-Tab>` on a blockquote it will increase/decrease the quote level
* `i_<Enter>` on a list item with no text in it (freshly created) it will delete everything till the column 0


# Known Bugs
* `formatlistpat` doesn't work for ordered lists
* avoid effect of `formatoptions` with horizontal rules (asterisks and dashes)


# TODO
* Code Blocks
  * edit html code block
  * edit jekyll front matter code block
  * explain in this file why I chose to avoid to highlight nested block elements
* Check Lists (GFM)
  * syntax highlight
  * when on over check item `<Space>` will check/uncheck it
* Tables (GFM)
  * syntax highlight
  * auto formatting tables if Tabular plugin is installed
* Emoji (GFM)
  * start completion when hitting `:` in insert mode only if preceded by empty spaces or is the beginning of the line
  * remove duplication between syntax keywords and dictionary completion
  * more `iabbr`
* Lists
  * `i_<BS>` on a list item with no text in it (freshly created) it will delete everything till the column 0
  * `<C-K>` on a list item it will swap it with the item above (if it exists)
  * `<C-J>` on a list item it will swap it with the item below (if it exists)
  * `>` and `<` should properly indent/unindent list items
  * `i_<C-D>` and `i_<C-T>` should properly indent/unindent list items and quote lines
* Define custom text objects for:
  * list items
  * check list items
  * paragraph
    * start of the next paragraph `}`
    * start of the previous paragraph `{`
  * other inline elements
