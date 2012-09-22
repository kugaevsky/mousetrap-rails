# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mousetrap-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "mousetrap-rails"
  gem.version       = Mousetrap::Rails::VERSION
  gem.authors       = ["Nick Kugaevsky"]
  gem.email         = ["nick@kugaevsky.ru"]
  gem.description   = %q{Mousetrap is a javascript library for handling keyboard shortcuts in your web applications. This gem integrates Mousetrap with Rails asset pipeline for easy of use.}
  gem.summary       = %q{Integrate Moustrap javascript library with Rails Asset Pipeline}
  gem.homepage      = "https://github.com/kugaevsky/mousetrap-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
