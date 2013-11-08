# Vim Github Markdown Support
... This i not ready by any means to be used, stay tuned :-)

# Why?
I wanted a strong support for the markdown flavour implemented by Github, I wanted a syntax highlight that would mirror the result I would find later on Github, I wanted a syntax hightlight that would not break easily, I wanted a syntax highlight that I could rely on (aka rapid feedback), I wanted something more that a mere syntax highlight. The [Markdown Syntax](http://daringfireball.net/projects/markdown/syntax) unfortunately it's so loosely defined that there are *flavours* of markdown that are subtly incompatible from each other, the [Markdown supported by Github](https://help.github.com/articles/github-flavored-markdown) is one of them.

# Development
## Resources
* [Markdown Github Syntax](https://help.github.com/articles/github-flavored-markdown)
* [Markdown Github API](http://developer.github.com/v3/markdown)
* [Markdown Github Quick Preview](http://github-markdown-preview.heroku.com/)

# TODO
* support syntax for emphasis elements
  * support emphasis inside other elements (features/contained_emphasis.md)
* explain in this file why I chose to avoid to highlight nested block elements
* how to automatically test that the syntax highlight is correct or at least to avoid regressions?
  * try with :TOhtml and compare that with a sample saved when the highlight of a particular element looks good
* support syntax for lists
* support syntax for code blocks
* support syntax for horizontal rules
* support syntax for links
* support syntax for code
* support syntax for images
* support for tables with tabularize
* support for spell checking
* MDOpenBlockquote will open the next level of Blockquote block under cursor in a markdown scratch buffer
