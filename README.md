# Mousetrap::Rails [![endorse](http://api.coderwall.com/kugaevsky/endorsecount.png)](http://coderwall.com/kugaevsky) [![Build Status](https://secure.travis-ci.org/kugaevsky/mousetrap-rails.png)](http://travis-ci.org/kugaevsky/mousetrap-rails) [![Dependency Status](https://gemnasium.com/kugaevsky/mousetrap-rails.png)](https://gemnasium.com/kugaevsky/mousetrap-rails) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kugaevsky/mousetrap-rails)

[Mousetrap](https://github.com/ccampbell/mousetrap) is a javascript library for handling keyboard shortcuts in your web applications written by [Craig Campbell](http://craig.is/).

The `mousetrap-rails` gem integrates Mousetrap javascript library with Rails Asset Pipeline.


## Installation

### Add mousetrap-rails gem to app

Add this line to your application's Gemfile:

    gem 'mousetrap-rails'

And then execute:

    $ bundle install

### Run generator

    $ rails generate mousetrap:install

It will create sample `keybindings.js.coffee` file in `app/assets/javascripts` and add `//= require mousetrap` to `application.js` manifest.

Voila!

### Latest (may be unstable) version

Instead of `gem 'mousetrap-rails'` add to your Gemfile

    gem 'mousetrap-rails', git: 'git://github.com/kugaevsky/mousetrap-rails.git'


## Usage

### Via data-attributes

You can add keyboard navigation to your links by using `data-keybinding` attribute.

```haml
= link_to 'Homepage', root_path, data: { keybinding: 'h' }      # Press 'h' to navigate to homepage
```

You can jump to input

```haml
= text_field_tag 'Username', nil, data: { keybinding: 'u' }     # Press 'u' to focus username input field
```

### Via javascript

Any javascript function can be called with mousetrap

```coffeescript
Mousetrap.bind 'f', (e) -> alert 'My perfect function called'   # Press 'f' to popup alert
```

### More examples (from official guide)

```coffeescript
# single keys
Mousetrap.bind '4', -> alert '4 pressed!'
Mousetrap.bind 'x', (-> alert 'x pressed!'), 'keyup'

# combinations
Mousetrap.bind 'command+shift+k', ->
  alert 'command+shift+k pressed!'
  false

Mousetrap.bind ['command+k', 'ctrl+k'], ->
  alert 'command+k or ctrl+k pressed!'
  false

# gmail style sequences
Mousetrap.bind 'g i', -> console.log 'g i sequence pressed!'
Mousetrap.bind '* a', -> console.log '* a sequence pressed!'

# konami code!
Mousetrap.bind 'up up down down left right left right b a enter', -> console.log 'You WIN!'
```

You can find full documentation on [Mousetrap library page](http://craig.is/killing/mice). Really, look there – there are plenty examples of using this awesome library.


## Changelog

All changes could be found in [CHANGELOG.md](https://github.com/kugaevsky/mousetrap-rails/blob/master/CHANGELOG.md)


## License

Gosh! It's [here](https://github.com/kugaevsky/mousetrap-rails/blob/master/LICENSE.md).


## Authors

* mousetrap-rails gem by [Nick Kugaevsky](http://kugaevsky.ru)
* original mousetrap library by [Craig Campbell](http://craig.is/)
