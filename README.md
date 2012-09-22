# Mousetrap::Rails

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

    # app/assets/javascripts/test_hotkeys.js.coffee
    Mousetrap.bind 's', -> console.log 's pressed!'

Run application and press `s` on your keyboard. You should see `s pressed!` message in your javascript console.

You can find full documentation on [Moustrap library page](http://craig.is/killing/mice). Really, look there – there are plenty examples of using this awesome library.

## Authors

* mousetrap-rails gem by [Nick Kugaevsky](http://kugaevsky.ru)
* original moustrap library by [Craig Campbell](http://craig.is/).
