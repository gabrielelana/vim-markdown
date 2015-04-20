# Markdown for Vim
A complete environment to create Markdown files with a syntax highlight that doesn't suck!

## Features
* Strong support for the Markdown flavor implemented by Github: what you see in Vim is what you get on Github
* Complete syntax implementation: supports proper nesting of all elements in list items, this is the only plugin that is able to do that (and I believe it since it took me a *while* to make it right)
  * A simple example rendered with this plugin. Headers and the fenced code block in list items are correctly highlighted
    ![VimMarkdownRendering](https://github.com/gabrielelana/vim-markdown/raw/master/images/vim_markdown_rendering.png)
  * The same example rendered with the most popular Markdown plugins for Vim
    ![VimMarkdownRenderingComparison1](https://github.com/gabrielelana/vim-markdown/raw/master/images/vim_markdown_rendering_comparison_1.png)
    ![VimMarkdownRenderingComparison2](https://github.com/gabrielelana/vim-markdown/raw/master/images/vim_markdown_rendering_comparison_2.png)
* Code blocks and pieces of Markdown of the current file could be edited in a separate buffer and synchronized back when you finished
  * Inside a ruby fenced code block with `<Leader>e` opens a temporary buffer with the right file type
  * Then select a range in visual mode and with `<Leader>e` opens a temporary buffer with file type `markdown` I call it *Focus Mode* because you can edit a portion of a Markdown file in isolation
  * At last, on an empty line, with `<Leader>e` asks for a file type and then opens a temporary buffer with that file type
  * You see that when you leave the temporary buffer the content syncs back to the main file
  ![EditCodeBlock](https://github.com/gabrielelana/vim-markdown/raw/master/images/vim_markdown_edit_code_block.gif)
* Folding for: headers, code blocks, html blocks and lists
* Format tables automatically (require [`Tabular`](https://github.com/godlygeek/tabular) plugin)
* Automatically detects Jekyll files and adds support for Liquid template engine
* This is a work in progress, more goodies and improvements are coming (see [TODO](#TODO)), stay tuned


## Why?
I wanted a strong support for the Markdown flavor implemented by Github, I wanted a syntax highlight that would mirror the result I would find later on Github, I wanted a syntax highlight that would not break easily, I wanted a syntax highlight that I could rely on (aka rapid feedback), I wanted something more that a mere syntax highlight. The [Markdown Syntax](http://daringfireball.net/projects/markdown/syntax) unfortunately it's so loosely defined that there are *flavors* of Markdown that are subtly incompatible from each other, the [Markdown supported by Github](https://help.github.com/articles/github-flavored-markdown) is one of them.


## Installation
If you use [Vundle](https://github.com/gmarik/vundle), add the following line to your `~/.vimrc`:

    Bundle 'gabrielelana/vim-markdown'

And then execute the following command in your shell:

    $ vim +'PluginInstall! vim-markdown' +qall

You can update to the latest version with the following command in your shell:

    $ vim +PluginUpdate

If you use [NeoBundle](https://github.com/Shougo/neobundle.vim), add the following line to your `~/.vimrc`:

    NeoBundle 'gabrielelana/vim-markdown'

And then execute the following command in your shell:

    $ vim +NeoBundleInstall +qall

You can update to the latest version with the following command in your shell:

    $ vim +NeoBundleInstall! +qall

If you use [Pathogen](https://github.com/tpope/vim-pathogen), execute the following in your shell:

    $ cd ~/.vim/bundle
    $ git clone https://github.com/gabrielelana/vim-markdown.git

If you are not using any package manager, download the [tarball](https://github.com/gabrielelana/vim-markdown/archive/master.tar.gz) and do this:

    $ cp vim-markdown-master.tar.gz ~/.vim
    $ cd ~/.vim
    $ tar --strip-components=1 --overwrite -zxf vim-markdown-master.tar.gz
    $ rm vim-markdown-master.tar.gz


## Self-Promotion
If you like this plugin, then consider to:
* Star the repository on [GitHub](https://github.com/gabrielelana/vim-markdown)
* Follow me on
  * [Twitter](http://twitter.com/gabrielelana)
  * [GitHub](https://github.com/gabrielelana)


## Documentation
I would use this section until I have a proper documentation

### Configuration
* `let g:markdown_include_jekyll_support = 0` to disable support for Jekyll files (enabled by default with: `1`)
* `let g:markdown_enable_folding = 1` to enable the fold expression `markdown#FoldLevelOfLine` to fold markdown files, this is disabled by default because it's a huge performance hit even when folding is disabled with `nofoldenable` option (disabled by default with: `0`)
* `let g:markdown_enable_mappings = 0` to disable default mappings (enabled by default with: `1`)
  * `let g:markdown_enable_insert_mode_mappings = 0` to disable insert mode mappings (enabled by default with: `1`)
  * `let g:markdown_enable_insert_mode_leader_mappings = 1` to enable insert mode leader mappings (disabled by default with: `0`)
* `let g:markdown_enable_spell_checking = 0` to disable spell checking (enabled by default with: `1`)
* `let g:markdown_enable_input_abbreviations = 0` to disable abbreviations for punctuations and emoticons (enabled by default with: `1`)

### Default Mappings (normal and visual mode)
_mappings are local to markdown buffers_
* `<Space>` (`NORMAL_MODE`) switch status of things:
  * Cases
    * A list item `* item` becomes a check list item `* [ ] item`
    * A check list item `* [ ] item` becomes a checked list item `* [x] item`
    * A checked list item `* [x] item` becomes a list item `* item`
  * Can be changed with `g:markdown_mapping_switch_status = '<Leader>s`
* `<Leader>ft` (`NORMAL_MODE`) format the current table
* `<Leader>e` (`NORMAL_MODE`, `VISUAL_MODE`) `:MarkdownEditCodeBlock` edit the current code block in another buffer with a guessed file type. The guess is based on the start of the range for `VISUAL_MODE`. If it's not possible to guess (you are not in a recognizable code block like a fenced code block) then the default is `markdown`. If it's not possible to guess and the current range is a single line and the line is empty then a new code block is created. It's asked to the user the file type of the new code block. The default file type is `markdown`.

### Optional Mappings (insert mode)
_mappings are local to markdown buffers_
* `<Leader>ft` (`INSERT_MODE`) same as `NORMAL_MODE` `<Leader>ft` with an additional mapping for `INSERT_MODE`
* `<Leader>e` (`INSERT_MODE`) same as `NORMAL_MODE` and `VISUAL_MODE` `<leader>e` with an additional mapping for `INSERT_MODE`

### Motions
* `]]` start of the next header
* `[[` start of the previous header

### While Editing in Insert Mode
* `|` in a table triggers the format command
* `<Tab>`/`<S-Tab>` on a list item it will indent/unindent the item
* `<Tab>`/`<S-Tab>` on a blockquote it will increase/decrease the quote level
* `<Enter>` on a list item with no text in it (freshly created) it will delete everything till the column 0


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
* Kramdown Syntax
  * Block Inline Attributes
  * Span Inline Attributes
  * Fenced Code Blocks with Inline Attributes
  * Definition Lists
  * Tables
  * Math Blocks
  * Footnotes
  * Abbreviations
  * End of Block Marker
* Code Blocks
  * Edit jekyll front matter code block
  * Explain in this file why I chose to avoid to highlight nested block elements
* Emoji (GFM)
  * Start completion when hitting `:` in insert mode only if preceded by empty spaces or is the beginning of the line
  * Remove duplication between syntax keywords and dictionary completion
  * More `iabbr`
* Lists
  * `i_<BS>` on a list item with no text in it (freshly created) it will delete everything till the column 0
  * `<C-K>` on a list item it will swap it with the item above (if it exists)
  * `<C-J>` on a list item it will swap it with the item below (if it exists)
  * `>` and `<` should properly indent/unindent list items
  * `i_<C-D>` and `i_<C-T>` should properly indent/unindent list items and quote lines
* Define custom text objects for:
  * List items
  * Check list items
  * Paragraph
    * Start of the next paragraph `}`
    * Start of the previous paragraph `{`
  * Other inline elements
* Folding
  * Fold HTML blocks
  * Always consider the first non space character of the line when check for syntax group
  * Always use `synstack` to check the syntax group of a position
  * Write specs for the whole thing
  * Support `foldtext` option
