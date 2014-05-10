---
layout: post
title: Blogging Like a Hacker
---

{% include footer.html %}

This is a Jekyll output tag {{ post.title }}

The following are Jekyll output tag with escape

{{ "{{" }} {{ "{%" }} {{ "}}" }} {{ "%}" }}

{{ "{%" }} this %}

{{ "{{" }} this }}

{{ "{{" }} {{ '"{%"' }} }} this %}

{{ "{{" }} {{ '"{{"' }} }} this }}

{% comment %}
This is a comment
{% endcomment %}

{% raw %}
This is a raw
{% endraw %}

{% highlight ruby %}
puts "This is some ruby code ;-)"
{% endhighlight %}
