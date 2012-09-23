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
  gem.summary       = %q{Integrate Mousetrap javascript library with Rails Asset Pipeline}
  gem.homepage      = "http://kugaevsky.github.com/mousetrap-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.licenses      = ['MIT', 'Apache']
  gem.post_install_message =  <<MSG

\033[33mRemeber to run generator to generate sample file and include mousetrap-rails with Rails Asset Pipeline\033[0m

    \033[32m$ rails generate mousetrap:install \033[0m

MSG
end
