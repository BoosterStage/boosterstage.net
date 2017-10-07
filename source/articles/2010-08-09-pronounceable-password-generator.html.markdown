---
title: Pronounceable Password Generator
date: 2010-08-09 20:24 UTC
tags: ruby, rails
excerpt: Here's a neat little Ruby snippet for generating pronounceable passwords.
featured_image: code.png

---

Here’s a neat little snippet of Ruby code for generating pronounceable passwords.

<script src="https://gist.github.com/mysmallidea/1cb61d1bd1e596f7a4182b169a059f35.js"></script>

Just call PronounceablePassword.generate_password! and you’ll get a nice password like “fabulous-99-bottles”

Of course, you should remind people to change their generated password, but this is useful for resetting passwords and simplifying a signup process.

You can also seed the generator with your own words - just dump a bunch of interesting words into the `lib/words.txt` file.
