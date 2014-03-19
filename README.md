# Github Flavoured Markdown for Vim
A complete environment to create Markdown files with a syntax highlight that don't suck!


## Features
* Strong support for the Markdown flavour implemented by Github: what you see in Vim is what you get on Github
* Complete syntax implementation: supports even proper nesting of all elements in list items, this is the only plugin that is able to do that (and I believe it since it took me a *while* to make it right)
* Code blocks and pieces of Markdown of the current file could be edited in a separate buffer and synchronized back when you finished
* Automatically detects Jekyll files and adds support for Liquid template engine
* This is a work in progress, more goodies and improvements are coming (see [TODO](#TODO)), stay tuned


## Why?
I wanted a strong support for the Markdown flavour implemented by Github, I wanted a syntax highlight that would mirror the result I would find later on Github, I wanted a syntax highlight that would not break easily, I wanted a syntax highlight that I could rely on (aka rapid feedback), I wanted something more that a mere syntax highlight. The [Markdown Syntax](http://daringfireball.net/projects/markdown/syntax) unfortunately it's so loosely defined that there are *flavours* of Markdown that are subtly incompatible from each other, the [Markdown supported by Github](https://help.github.com/articles/github-flavored-markdown) is one of them.


## Installation
If you use [Vundle](https://github.com/gmarik/vundle), add the following line to your `~/.vimrc`:

    Bundle 'gabrielelana/vim-markdown'

And then execute the following command in your shell:

    $ vim +'BundleInstall! vim-markdown' +qall

If you use [Pathogen](https://github.com/tpope/vim-pathogen), execute the following in your shell:

    $ cd ~/.vim/bundle
    $ git clone https://github.com/gabrielelana/vim-markdown.git

If you are not using any package manager, download the [tarball](https://github.com/gabrielelana/vim-markdown/archive/master.tar.gz) and do this:

    $ cp vim-markdown-master.tar.gz ~/.vim
    $ cd ~/.vim
    $ tar --strip-components=1 --overwrite -zxf vim-markdown-master.tar.gz
    $ rm vim-markdown-master.tar.gz


## Self-Promotion
Do you like this?
* Star the repository on [GitHub](https://github.com/gabrielelana/vim-markdown)
* Follow me on
  * [Twitter](http://twitter.com/gabrielelana)
  * [GitHub](https://github.com/gabrielelana)


## Documentation
I would use this section until I have a proper documentation

### Configuration
* `let g:markdown_include_jekyll_support = 1` to load support to Jekyll files (default: 1)
* `let g:markdown_include_default_mappings = 1` to load default mappings (default: 0)
  * `let g:markdown_include_insert_mode_default_mappings = 1` to load also insert mode default mappings (default: 0)

### Default Mappings
All default mappings are local to markdown buffers
* `<Leader>e` (`NORMAL_MODE`, `VISUAL_MODE`, `INSERT_MODE`) `:MdEditCodeBlock` edit the current code block in another buffer with a guessed file type. The guess is based on the start of the range for `VISUAL_MODE`. If it's not possibile to guess (you are not in a recognizable code block like a fenced code block) then the default is `markdown`. If it's not possibile to guess and the current range is a single line and the line is empty then a new code block is created. It's asked to the user the file type of the new code block. The default file type is `markdown`.

### Motions
* `]]` start of the next header
* `[[` start of the previous header

### While Editing in Insert Mode
* `i_<Tab>`/`i_<S-Tab>` on a list item it will indent/unindent the item
* `i_<Tab>`/`i_<S-Tab>` on a blockquote it will increase/decrease the quote level
* `i_<Enter>` on a list item with no text in it (freshly created) it will delete everything till the column 0


## Development
### Resources
* [Markdown Github Syntax](https://help.github.com/articles/github-flavored-markdown)
* [Markdown Github API](http://developer.github.com/v3/markdown)
* [Markdown Github Quick Preview](http://github-markdown-preview.heroku.com/)

### Syntax Specs
Testing syntax highlight could be tricky, here I use the golden master patter to at least avoid regressions, this is how it works: in `./rspec/features` you will find a bunch of `*.md` files, one for each syntactic element supported, for each of those files there's an html file, this file is created with the `:TOhtml` command and it's the reference (aka golden master) of the syntax highlight of the original file. Running `rspec` you are comparing the current syntax highlight of all the feature's file with the reference syntax highlight. If looking at some of the feature's file you see something wrong you can fix it and after regenerate the golden master files with `GENERATE_GOLDEN_MASTER=1 rspec`


## Known Bugs
* `formatlistpat` doesn't work for ordered lists
* `formatoptions` thinks that `*` in horizontal rules are list items


<a name="TODO" />
## TODO
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
