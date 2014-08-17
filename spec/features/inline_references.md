Reference [bar] [1]

Reference [bar][1]

Reference [bar]
[1]

[1]: /url/ "Title"


With [embedded [brackets]][b]
With quoted [embedded \[brackets\]][b]
With quoted [embedded \[ brackets][b]
With quoted [embedded \] brackets][b]

[b]: /url/

Indented [once][] times
Indented [twice][] times
Indented [thrice][] times
Indented [four][] times must not a reference, must be a code block

 [once]: /url
  [twice]: /url
   [thrice]: /url
    [four]: /url

With [angle brackets][]
And [without][]

[angle brackets]: <http://example.com/> "Angle Brackets"
[without]: http://example.com/ "Without angle brackets."

With [line
breaks][]

[line breaks]: http://example.com "Yes this works"

---
The following should be supported but they are not... In GFM and Kramdown link references could omit the second pair of square brackets, with a programming language is possible to check if something between square brackets has a related link definition an so to be interpreted as link reference but here it would be impossible

[short ref]

[short
ref]

[short ref]: http://example.com "No more hanging empty bracket!"

[a ref]

[a ref]: http://example.com
    "Title on next line."
