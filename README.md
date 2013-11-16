# Vim Github Markdown Support
... This i not ready by any means to be used, stay tuned :-)

# Why?
I wanted a strong support for the markdown flavour implemented by Github, I wanted a syntax highlight that would mirror the result I would find later on Github, I wanted a syntax highlight that would not break easily, I wanted a syntax highlight that I could rely on (aka rapid feedback), I wanted something more that a mere syntax highlight. The [Markdown Syntax](http://daringfireball.net/projects/markdown/syntax) unfortunately it's so loosely defined that there are *flavours* of markdown that are subtly incompatible from each other, the [Markdown supported by Github](https://help.github.com/articles/github-flavored-markdown) is one of them.

# Development
## Resources
* [Markdown Github Syntax](https://help.github.com/articles/github-flavored-markdown)
* [Markdown Github API](http://developer.github.com/v3/markdown)
* [Markdown Github Quick Preview](http://github-markdown-preview.heroku.com/)

## Syntax Specs
Testing syntax highlight could be tricky, here I use the golden master patter to at least avoid regressions, this is how it works: in `./rspec/features` you will find a bunch of `*.md` files, one for each syntactic element supported, for each of those files there's an html file, this file is created with the `:TOhtml` command and it's the reference (aka golden master) of the syntax highlight of the original file. Running `rspec` you are comparing the current syntax highlight of all the feature's file with the reference syntax highlight. If looking at some of the feature's file you see something wrong you can fix it and after regenerate the golden master files with `GENERATE_GOLDEN_MASTER=1 rspec`

# TODO
* support syntax for lists
  * support for ordered lists
  * support for proper list nesting
    * markdownListBlock should be a transparent region
      * starts with a markdownListItem not preceded by a markdownListItem
      * ends with a markdownListItem not followed by a markdownListItem
    * markdownListItem should be a region
      * could contain other markdownListItem 
      * should highlight the list delimiter
  * editing support through vim script?
    * when hitting <Enter> on a list item it will create another list item on the next line
    * when hitting <C-Enter> on a list item it will go to the next line on the same column as the first character of the line above
    * when hitting <Tab> on a list item it will indent the item (check if it's in a list?)
    * when hitting <S-Tab> on a list item it will unindent the item (check if it's in a list?)
    * when hitting <Enter> on a list item with no text in it (freshly created) it will delete the list item (everything till the column 0)
    * when hitting <C-BS> on a list item with no text in it (freshly created) it will delete the list item (everything till the column 0)
* support syntax for code blocks
* support syntax for horizontal rules
* support syntax for links
* support syntax for code
* support syntax for images
* support for tables with tabularize
* support for spell checking
* support for custom text objects
* open next quote level of a blockquote element in a scratch buffer, edit it with markdown syntax highlight, on exit copy the buffer's content back in the original file with the original quote level
  * explain in this file why I chose to avoid to highlight nested block elements
