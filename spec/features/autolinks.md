
URL like http://google.com gets auto linked

URL may contain punctuation http://example.com/foo,bar,baz

URL may be preceded by punctuation !http://example.com/foo,bar,baz so the exclamation point is not part of the URL

URL are terminated by punctuation so http://example.com/foo, the comma is not part of the URL

URL may contain parenthesis http://example.com/(foo)?foo[1]=bar&foo[2]=baz

URL may be surrounded by parenthesis (http://example.com/foo) but parenthesis are not part of the URL

URL may terminate with parenthesis http://example.com/foo()

URL may be surrounded by parenthesis (http://example.com/foo()) but the surrounding parenthesis are not part of the URL

Email addresses bill@microsoft.com get auto linked

Path are supported /clean/code/that/works but they must be preceded by a non work because this /is a path and this/is not a path

Pull requests and issues are linked #42
  could be preceded by symbols \#42
  could not be preceded by letters a#42 or numbers 3#42

Reference to other users are linked @gabrielelana
  could be preceded by symbols \@gabrielelana
  could not be preceded by letters a@gabrielelana or numbers 3@gabrielelana
