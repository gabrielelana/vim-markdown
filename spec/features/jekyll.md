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
{% nocomment %}

{% raw %}
This is a raw
{% noraw %}
