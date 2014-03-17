
    * this is not an item list this is a code block because it has 4 leading spaces

* First level, first item

  Code blocks not contained in list items must have at least 4 leading spaces. Code blocks contained in list items must have at least 8 leading spaces for the first level and additional 2 leading spaces per level

        This is a code block contained in a first level list item

  * Second level, first item

        This is not a code block, it could be because it has 8 leading spaces but it's not because it's contained in a second level list item, the following it's a code block because it has 10 leading spaces (8+2*(level-1))

          This is a code block contained in a second level list item

  Now we are back to the first level item so the following code block could be indented with 8 leading spaces

        This is a code block contained in a first level list item

  * Second level, second item
    * Third level, first item

            This is a code block contained in a third level list item because it has 12 leading spaces (8+2*(level-1))

  * Second level, third item
          This could be a code block because it has 10 leading spaces but it's not because it's not preceded by a mandatory blank line

          This is a code block because it has 10 leading spaces and it's preceded by a blank line



* First level, third item

          This is a code block, not a surprise


    This is a code block because two consecutive new lines terminates the list item so 4 leading spaces are enough for a code block


* First level, first item
  First level, first item
* First level, second item
  First level, second item
  First level, second item

  First level, second item, a single blank line is not enough to terminate a list item

      So this is not a code block even with 6 leading spaces

        This is code block because 8 leading white spaces are needed as it's contained by a first level list item



