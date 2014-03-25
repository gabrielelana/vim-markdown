This is inline `code` with a single back tick

This is inline ``code`` with double back ticks

This is inline ```code``` with triple back ticks. This is not standard Markdown but Github supports it and so do we. Actually Github allows an arbitrary number of backs ticks around inline `````codeblocks````` the only constraint is that they should be ```even```` the remainder, in this case the last back tick, should not be highlighted

The following is a generic block code with a triple tick
```
code
```

The following is a fenced block code with a triple tick
```js
var foo = 'bar'
```

A fenced code block must have at least 3 back ticks in the start delimiter but could have more
````````ruby
foo = 'bar' if foo.empty?
```

A fenced code block must have at least 3 back ticks in the end delimiter but could have more
```ruby
foo = 'bar' if foo.empty?
````````

A fenced code block could have at most 3 leading spaces in the start delimiter
   ```ruby
foo = 'bar' if foo.empty?
```

A fenced code block could have at most 3 leading spaces in the end delimiter
```ruby
foo = 'bar' if foo.empty?
   ```

A fenced code block could have at most 3 leading spaces in the start and in the end delimiter
  ```ruby
foo = 'bar' if foo.empty?
 ```


    this is a code block because it's indented with 4 spaces
    this should be a continuation

This line separates two blocks

	this is a code block because it's indented with a \t
	this should be a continuation


The following is not standard Markdown, officially it's not the Github Flavored Markdown either, it's inspired by the Kramdown Flavored Markdown. Even if not documented Github supports it and so do we

~~~ruby
foo = 'bar' if foo.empty?
~~~

~~~~~~~~ruby
foo = 'bar' if foo.empty?
~~~

~~~ruby
foo = 'bar' if foo.empty?
~~~~~~~~

   ~~~ruby
foo = 'bar' if foo.empty?
~~~

~~~ruby
foo = 'bar' if foo.empty?
   ~~~

  ~~~ruby
foo = 'bar' if foo.empty?
 ~~~
