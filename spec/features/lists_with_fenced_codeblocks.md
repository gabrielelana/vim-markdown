```ruby
# This is a fenced code block
def ruby; end
```

    ```ruby
    # This is not a fenced code block but a code block
    def ruby; end
    ```

* First level, first item
  First level, first item with `inline` element ``foo`` ``foo``

  Still first level, first item, the following it's not a fenced code block but an inline code block
  ```ruby
  def ruby; end
  ```

  Still first level, first item, the following it's a fenced code block because it's preceded by an empty line

  ```ruby
  def ruby; end
  ```


* First level, first item
  * Second level, first item
    * Third level, first item
      * Fourth level, first item

        ```ruby
        # This is a fenced code block and not a code block even it has 8 leading spaces because it's contained in a fourth level list item
        def ruby; end
        ```


* First level, first item

  ```ruby
  def ruby; end
  ```

    ```ruby
    def ruby; end
    ```

      ```ruby
      def ruby; end
      ```

        ```ruby
        # This is not a fenced code block because it has 8 leading white spaces and so it's a code block
        def ruby; end
        ```
