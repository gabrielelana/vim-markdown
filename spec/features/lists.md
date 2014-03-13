Stars

* first item
* second item
* third item


Dashes

- first item
- second item
- third item


Pluses

+ first item
+ second item
+ third item

Ordered

1. first item
2. second item
3. third item

Nesting

* first item first level
  * second item second level
    * third item third level
    * fourth item third level
      1. first item of the fourth level
      2. second item of the fourth level

List items on multiple lines

* this is the first item in the list
this is still the first item even if it's the second line
* this is the second item in the list
this is still the second item even if it's the second line
this is still the second item even if it's the third line

this is not part of the above list


List items on multiple lines aligned

* this is the first item in the list
  this is still the first item even if it's the second line
* this is the second item in the list
  this is still the second item even if it's the second line
  this is still the second item even if it's the third line

  this is still the second item even if it's separated with a newline

this is not part of the above list


Leading space are supported

  * first item
  * second item


Leading space with multiple list items

  * this is the first item in the list
    this is still the first item even if it's the second line
  * this is the second item in the list
    this is still the second item even if it's the second line
    this is still the second item even if it's the third line

    this is still the second item even if it's separated with a newline

A single list delimiter followed by a newline is not a list item

*

A single list delimiter followed by at least one space is a list item

*

List with inline elements

* list item _ending_
with _emphasis_.

* list item
with **strong emphasis**.

* list item
with [a link](http://google.com).

* list items can have *inline content
  that spans multiple lines*

*this is not a list item but a weak emphasis element beginning at the beginning of the line*

* this is a list item that ends with an asterisk *

Everything that immediately follows a list item is still part of the list item and a list item could not contain (at least for Github but not for the original Dingus interpreter) block elements like headers

* This is a list item
# This is not an header, is the continuation of the previous list item, an empty line is needed to terminate a list item

# This is an header
