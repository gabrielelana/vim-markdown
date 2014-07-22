Stars

* First item
* Second item
* Third item


Dashes

- First item
- Second item
- Third item


Pluses

+ First item
+ Second item
+ Third item

Ordered

1. First item
2. Second item
3. Third item

10. Index with more than one digit item
11. Index with more than one digit item
12. Index with more than one digit item

Nesting

* First item first level
  * Second item second level
    * Third item third level
    * Fourth item third level
      1. First item of the fourth level
      2. Second item of the fourth level

List items on multiple lines

* This is the first item in the list
this is still the first item even if it's the second line
* This is the second item in the list
this is still the second item even if it's the second line
this is still the second item even if it's the third line

This is not part of the above list


List items on multiple lines aligned

* This is the first item in the list
  this is still the first item even if it's the second line
* This is the second item in the list
  this is still the second item even if it's the second line
  this is still the second item even if it's the third line

  This is still the second item even if it's separated with a newline

This is not part of the above list


Leading space are not allowed, well technically they are… in Dingus (the official markdown engine) leading spaces (up to 3) are allowed in list items but I chose to not allow it because it could lead to nasty situations like the following

  * On Dingus this is a first level list item
 * But this is a second level list item, even if its indentation it's lower than the line before… looking at the text don't tell me this is not confusing

A single list delimiter followed by a newline is not a list item

*

A single list delimiter followed by a single space and a newline is a list item

*


List with inline elements

* List item _ending_
with _emphasis_.

* List item with **strong emphasis**.

* List item with [a link](http://google.com).

* List items can have *inline content
  that spans multiple lines*

*this is not a list item but a weak emphasis element beginning at the beginning of the line*

* This is a list item that ends with an asterisk *

Everything that immediately follows a list item is still part of the list item and a list item could not contain (at least for Github but not for the original Dingus interpreter) block elements like headers if not preceded by a new line

* This is a list item
# This is not an header, is the continuation of the previous list item, an empty line is needed to terminate a list item

# This is an header
