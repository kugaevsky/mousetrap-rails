# Mousetrap::Rails [![endorse](http://api.coderwall.com/kugaevsky/endorsecount.png)](http://coderwall.com/kugaevsky)

[Moustrap](https://github.com/ccampbell/mousetrap) is a javascript library for handling keyboard shortcuts in your web applications written by [Craig Campbell](http://craig.is/).

The `mousetrap-rails` gem integrates Moustrap javascript library with Rails Asset Pipeline.

## Installation

### Install mousetrap-rails gem

Add this line to your application's Gemfile:

    gem 'mousetrap-rails'

And then execute:

    $ bundle install

### Include moustrap to asset pipeline

Add to your `app/assets/javascripts/application.js` file

    //= require mousetrap

Voila!

## Usage

Now you can use Moustrap library features in your rails application. To test it out create coffeescript file in your `app/assets/javascripts` directory and add to it this code

```coffeescript
# app/assets/javascripts/test_hotkeys.js.coffee
Mousetrap.bind 's', -> console.log 's pressed!'
```

Run application and press `s` on your keyboard. You should see `s pressed!` message in your javascript console.

### More examples

```coffeescript
# single keys
Mousetrap.bind '4', -> console.log '4 pressed!'
Mousetrap.bind 'x', (-> console.log 'x pressed!'), 'keyup'

# combinations
Mousetrap.bind 'command+shift+k', ->
  console.log 'command+shift+k pressed!'
  false

Mousetrap.bind ['command+k', 'ctrl+k'], ->
  console.log 'command+k or ctrl+k pressed!'
  false

# gmail style sequences
Mousetrap.bind 'g i', -> console.log 'g i sequence pressed!'
Mousetrap.bind '* a', -> console.log '* a sequence pressed!'

# konami code!
Mousetrap.bind 'up up down down left right left right b a enter', -> console.log 'You WIN!'
```


You can find full documentation on [Moustrap library page](http://craig.is/killing/mice). Really, look there – there are plenty examples of using this awesome library.

## Authors

* mousetrap-rails gem by [Nick Kugaevsky](http://kugaevsky.ru)
* original moustrap library by [Craig Campbell](http://craig.is/)
