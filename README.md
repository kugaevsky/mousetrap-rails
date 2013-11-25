# Mousetrap::Rails
[![Flattr this](http://api.flattr.com/button/flattr-badge-large.png)](http://flattr.com/thing/1233054/Mousetrap-rails-gem) [![endorse](http://api.coderwall.com/kugaevsky/endorsecount.png)](http://coderwall.com/kugaevsky) [![Dependency Status](https://gemnasium.com/kugaevsky/mousetrap-rails.png)](https://gemnasium.com/kugaevsky/mousetrap-rails) [![Code Climate](https://codeclimate.com/github/kugaevsky/mousetrap-rails.png)](https://codeclimate.com/github/kugaevsky/mousetrap-rails) [![Build Status](https://travis-ci.org/kugaevsky/mousetrap-rails.png?branch=master)](https://travis-ci.org/kugaevsky/mousetrap-rails) [![Coverage Status](https://coveralls.io/repos/kugaevsky/mousetrap-rails/badge.png?branch=master)](https://coveralls.io/r/kugaevsky/mousetrap-rails)

[Mousetrap](https://github.com/ccampbell/mousetrap) is a javascript library for handling keyboard shortcuts in your web applications written by [Craig Campbell](http://craig.is/).

The `mousetrap-rails` gem integrates Mousetrap javascript library with Rails asset pipeline.

## Installation

### Add mousetrap-rails gem to app

Add this line to your application's Gemfile:

```ruby
gem 'mousetrap-rails'
```

And then execute:

```bash
$ bundle install
```

### Run generator

```bash
$ rails generate mousetrap:install
```

It will create a sample `keybindings.js.coffee` file in `app/assets/javascripts` and insert mousetrap-rails files to manifests of asset pipeline

```coffeescript
//= require mousetrap     # ---> application.js
*= require mousetrap      # ---> application.css
```

Voila!

Also you can use mousetrap plugins. Require them in your `application.js` file

```javascript
//= require mousetrap/plugins       # To require all plugins
//= require mousetrap/dictionary    # To require dictionary plugin
//= require mousetrap/global        # To require global plugin
//= require mousetrap/pause         # To require pause plugin
//= require mousetrap/record        # To require record plugin
```

See plugin descriptions below.

### Latest (may be unstable) version

Instead of `gem 'mousetrap-rails'` add to your Gemfile

```ruby
gem 'mousetrap-rails', github: 'kugaevsky/mousetrap-rails'
```

`Mousetrap-rails` versioning use `mousetrap.js` library version number.

## Usage

### Via data-attributes

You can add keyboard navigation to your links by using `data-keybinding` attribute.

```haml
= link_to 'Homepage', root_path, data: { keybinding: 'h' }          # Press 'h' to navigate to homepage
= link_to 'About', about_path, data: { keybinding: '["a", "c"]' }   # Press 'a' or 'c' to navigate to about
```

You can jump to an input

```haml
= text_field_tag 'Username', nil, data: { keybinding: 'u' }         # Press 'u' to focus username input field
```

### Via javascript

Any javascript function can be called with mousetrap

```coffeescript
Mousetrap.bind 'f', (e) -> alert 'My perfect function called'       # Press 'f' to popup alert
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

### Key binding hints (experimental)

You can display key binding hints near links with `data-keybinding` attribute by pressing `Alt+Shift+h`. Now it's just experimental feature for debugging purposes only.

## Plugins

### Global Bindings

    //= require mousetrap/global        # ---> application.js

This extension allows you to specify keyboard events that will work anywhere including inside textarea/input fields.

```coffeescript
Mousetrap.bindGlobal 'ctrl+s', -> _save()
```

This means that a keyboard event bound using `Mousetrap.bind` will only work outside of form input fields, but using `Moustrap.bindGlobal` will work in both places.


### Bind dictionary

    //= require mousetrap/dictionary        # ---> application.js

This extension overwrites the default bind behavior and allows you to bind multiple combinations in a single bind call.

Usage looks like:

```coffeescript
Mousetrap.bind
    'a': -> console.log('a')
    'b': -> console.log('b')
```

You can optionally pass in `keypress`, `keydown` or `keyup` as a second argument.

Other bind calls work the same way as they do by default.


### Pause/unpause

    //= require mousetrap/pause             # ---> application.js

This extension allows Mousetrap to be paused and unpaused without having to reset keyboard shortcuts and rebind them.

```coffeescript
# stop Mousetrap events from firing
Mousetrap.pause()

# allow Mousetrap events to fire again
Mousetrap.unpause()
```


### Record

    //= require mousetrap/record              # ---> application.js

This extension lets you use Mousetrap to record keyboard sequences and play them back:

```slim
button onclick="recordSequence()" Record
```

```coffeescript
recordSequence = () ->
  Mousetrap.record (sequence) ->
    # sequence is an array like ['ctrl+k', 'c']
    alert('You pressed: ' + sequence.join(' '))
````

[More detailed plugins description](http://craig.is/killing/mice#extensions)

## Contributing

Please submit all pull requests against latest `*.wip` branch. If your pull request contains new features, you **must** include relevant tests.

You can easily update mousetrap.js library via rake tasks.

```bash
$ rake mousetrap:update          # Update main mousetrap javascript lib and its plugins
$ rake mousetrap:update:main     # Update main mousetrap javascript lib
$ rake mousetrap:update:plugins  # Update mousetrap javascript lib plugins
```

Thanks in advance!


## Changelog

All changes could be found in [CHANGELOG.md](https://github.com/kugaevsky/mousetrap-rails/blob/master/CHANGELOG.md)


## License

Gosh! It's [here](https://github.com/kugaevsky/mousetrap-rails/blob/master/LICENSE.md).


## Authors

* mousetrap-rails gem by [Nick Kugaevsky](http://kugaevsky.ru) and [contributors](https://github.com/kugaevsky/mousetrap-rails/graphs/contributors)
* original mousetrap library by [Craig Campbell](http://craig.is/)
