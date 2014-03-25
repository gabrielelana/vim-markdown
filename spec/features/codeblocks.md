This is inline `code` with a single back tick

This is inline ``code`` with a double back tick

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
