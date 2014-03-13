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

[short ref]

[short
ref]

[short ref]: http://example.com "No more hanging empty bracket!"

[a ref]

[a ref]: http://example.com
    "Title on next line."
