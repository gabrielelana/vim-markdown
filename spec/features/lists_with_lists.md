* First level, first item
  * Second level, first item
    * Third level, first item
    still on the third level, first item

    Back to the second level, first item, yes, the indentation it's the same as the last non blank line but this it's preceded with a blank line so it's not considered a continuation of the list item but another element ans since it's less indented than the list item it's not contained in it but in it's parent

  Back to the first level, first item
  * Second level, second item

    Still on the third level, first item because the indentation is right for the third level

* First level, first item
  * Second level, first item
    * Third level, first item
      * Fourth level, first item
this is still the fourth level, it's a continuation of the first line no matter what, a blank line it's needed to end the list item


* First level, first item
    * A third level could not be contained in a first level, again this is technically supported but I choose to not allow it both for the sake of simplicity and to avoid confusing situation: this would be considered not a third level but a second level with leading spaces until a certain point, after that it's considered as a continuation of the first item… as I said, confusing better to stick to simple and consistent rules
