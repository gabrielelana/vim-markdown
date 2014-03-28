Tables with at least two columns at least must have pipes to separate columns

  Header-1|Header-2
  ---|---
  Row-1-Column-1|Row-1-Column-2

  Header-1|Header-2
  ---|---
  Row-1-Column-1|Row-1-Column-2
  Row-2-Column-1|Row-2-Column-2

  |Header-1|Header-2
  |---|---
  |Row-1-Column-1|Row-1-Column-2

  Header-1|Header-2|
  ---|---|
  Row-1-Column-1|Row-1-Column-2|

  |Header-1|Header-2|
  |---|---|
  |Row-1-Column-1|Row-1-Column-2|


Between dashes and pipes spaces are allowed

  Header-1       | Header-2
    ---          | ---
  Row-1-Column-1 | Row-1-Column-2


Tables with alignment hints (left, right and center)

  Header-1       | Header-2
  :--------------|:--------------
  Row-1-Column-1 | Row-1-Column-2

  Header-1       | Header-2
  --------------:|--------------:
  Row-1-Column-1 | Row-1-Column-2

  Header-1       | Header-2
  :-------------:|:-------------:
  Row-1-Column-1 | Row-1-Column-2


Tables could contain inline elements

  www.example.com | Header-2
    ---          | ---
  ~~Row-1-Column-1~~ | *Row-1-Column-2*


Tables with single column at least should have a pipes on one side

  |Header-1
  |---
  |Row-1-Column-1

  Header-1|
  ---|
  Row-1-Column-1|

  |Header-1|
  |---|
  |Row-1-Column-1|

  So this is not not a table with one column but some stings and a separator (it's not an header because it doesn't begin at the first column)

  Header-1
  ---
  Row-1-Column-1


Tables could have only headers

  Header-1|Header-2
  ---|---


Surprisingly tables could have as many leading spaces as wanted, they never turn as code blocks

            Header-1|Header-2
            ---|---
            Row-1-Column-1|Row-1-Column-2

      Header-1|Header-2
  ---|---
            Row-1-Column-1|Row-1-Column-2


Tables should be preceded by an empty line, so the following is not a table

  Not an empty line
  Header-1|Header-2
  ---|---
  Row-1-Column-1|Row-1-Column-2


The separator between header and the rows should have at least 3 dashes, so the following is not a table

  Header-1|Header-2
  --|---
  Row-1-Column-1|Row-1-Column-2

