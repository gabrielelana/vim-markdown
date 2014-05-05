
This is _weak_ emphasis

This is also *weak* emphasis

This is _multiple words_ weak emphasis

This is also *multiple words* weak emphasis

This is _ not valid _ because the start delimiter must be followed by something (not a space)

*weak* emphasis could be the first word in the line

_weak_ emphasis could be the first word in the line

Weak *emphasis
could span* multiple lines

Weak _emphasis
could span_ multiple lines

Weak _emphasis `could` contain_ inline code

Weak _emphasis **could** contain_ strong emphasis

The following is not a weak emphasis _
that span multiple lines
_ because the start delimiter must be followed by something (not the end of line)

The following is not a weak emphasis *
that span multiple
lines* because the start delimiter must be followed by something (not the end of line)

The usage of alternate delimiters must be idempotent, so all _foo_ *foo* _*foo*_ *_foo_* must be "foo" highlighted as italic

The same delimiter could not be used twice **foo** and __foo__ must not be highlighted as italic

_foo__bar_ must be "foo" highlighted as italic followed by "{UNDERSCORE}bar{UNDERSCORE}" highlighted as normal

_foo_*bar* must be "foo" highlighted as italic followed by "bar" highlighted as italic

_foo_b must be "foo" highlighted as italic followed by "b" highlighted as normal

_foo_bar_baz_ must be "foo" highlighted as italic followed by "bar{UNDERSCORE}baz{UNDERSCORE}" highlighted as normal

_foo_bar _baz_ must be "foo" and "baz" highlighted as italic and "bar" highlighted as normal

Two underscores __ or two asterisks ** must not be highlighted without something between them

Spaces do not count for something so _ _ and * * must be normal

FOO_BAR must be normal

FOO_BAR and BAR_FOO must be normal

Unfortunately _FOO_BAR doesn't work but escaping \_FOO_BAR is always possible

