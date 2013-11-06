# Vim Markdown Support
... This i not ready by any means to be used, stay tuned :-)

# Why?
Because I couldn't find a syntax file that would match my expectations

# Development
## Resources
* [Markdown Syntax](http://daringfireball.net/projects/markdown/syntax)
* [Markdown Debugger](http://daringfireball.net/projects/markdown/dingus)

# TODO
* support syntax for inline elements
  * support inside other elements
  * support bold+italic combination patterns __*foo*__ **_foo_** _**foo**_ *__foo__*
  * should play well with lists :-)
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
