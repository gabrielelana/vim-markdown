
This is __strong__ emphasis

This is also **strong** emphasis

This is __multiple words__ strong emphasis

This is also **multiple words** strong emphasis

This is __ not valid __

**strong** emphasis could be the first word in the line

__strong__ emphasis could be the first word in the line

Strong **emphasis
could span** multiple lines

Strong __emphasis
could span__ multiple lines

Strong __emphasis `could` contain__ inline code

Strong __emphasis *could* contain__ weak emphasis

The following is not a strong emphasis __
that span multiple lines
__ because the start delimiter must be followed by something (not the end of line)

The following is not a strong emphasis **
that span multiple lines
** because the start delimiter must be followed by something (not the end of line)

The usage of alternate delimiters must be idempotent, so all __foo__ **foo** __**foo**__ **__foo__** must be "foo" highlighted as bold

The same delimiter could not be used twice ****foo*** and ____foo____ must be normal

__foo____bar__ must be "foo" highlighted as bold followed by "{UNDERSCORE}{UNDERSCORE}bar{UNDERSCORE}{UNDERSCORE}" highlighted as normal

__foo__**bar** must be "foo" highlighted as bold followed by "bar" highlighted as bold

__foo__b must be "foo" highlighted as bold followed by "b" highlighted as normal

__foo__bar__baz__ must be "foo" highlighted as bold followed by "bar{UNDERSCORE}baz{UNDERSCORE}" highlighted as normal

__foo__bar __baz__ must be "foo" and "baz" highlighted as bold and "bar" highlighted as normal

Four underscore ____ or four asterisks **** must not be highlighted without something in between

Spaces do not count for something so __ __ and ** ** must be normal

FOO__BAR must not be normal

FOO__BAR and BAR__FOO must be normal

Unfortunately __FOO__BAR doesn't work but escaping \__FOO__BAR is always possible

