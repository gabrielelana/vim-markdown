Link [link](http://example.com)

Link with title [link](http://example.com "Title")

Link with title surrounded by single quotes [link](http://example.com 'Title')

Link to a relative path [link](/about)

Link to an anchor [link](#about)

Link to an image ![image](path/to/image.png)

Link with escaped parenthesis in URL [link](/url\(test\) "Title")

Link with unescaped parenthesis in URL [link](/url(test) "Title")

The following is not a link because it's escaped \[link](http://example.com) the URL must be auto linked anyway but the rounded parenthesis must not be highlighted

Link with escaped closed square bracket in text [text \] link](http://example.com)

Link with inline element in text [this **is** a link](http://example.com)

Link with newline in text [text
link](http://inline.com)

Link with multiple newline in text [this
is
text
in
link](http://inline.com)

Link with spaces between text and URL it's ok [link]     (http://example.com)

Link with newline between text and URL it's ok [link]
(http://example.com)

Link with newline between URL and title it's ok [link](http://example.com
"Title")

# This is [link](http://github.com) in a title

[Link](http://example.com) at beginning of the line. Bug: this was considered as link definition


---
The following are not valid links


No more than one newline between text and URL [link]

(http://example.com)


No more that one newline in text [text

link](http://example.com)


No more that one newline between URL and title [link](http://example.com

"Title")
