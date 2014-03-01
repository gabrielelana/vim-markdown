Link [link](http://example.com)

Link with title [link](http://example.com "Title")

Link with title surrounded by single quotes [link](http://example.com 'Title')

Link to a relative path [link](/about)

Link with escaped parenthesis in URL [link](/url\(test\) "Title")

Link with spaces in URL [link](Link to file/Lorem Ipsum.txt "Title")

Link with escaped closed square bracket in it [text \] link](http://example.com)

Link with inline element in text [this **is** a link](http://example.com)

Link with newline in text [text
link](http://inline.com)

Link with spaces between text and URL it's ok [link]     (http://example.com)

Link with newline between text and URL it's ok [link]
(http://example.com)

# This is [link](http://github.com) in a title


The following is not a link because it's escaped \[link](http://example.com) but the URL must be auto linked anyway

Link with non-escaped parenthesis in URL are not supported [link](/url(test) "Title")

The following is a bug I found, I'll tell you that because this one is particularly odd, it's not a test a test case I came up with
* content between rounded parenthesis in an list item (like this) should not be considered links

[This] should not be highlighted
