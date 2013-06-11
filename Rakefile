require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

namespace :mousetrap do
  desc "Update Mousetrap javascript library from https://raw.github.com/ccampbell/mousetrap/master/mousetrap.js"
  task :update do
    ORIGIN_URL  = "https://raw.github.com/ccampbell/mousetrap/master/mousetrap.js"
    FILE_PATH   = "vendor/assets/javascripts/mousetrap.js"
    puts "Updating Mousetrap.js library from origin"
    puts "#{ORIGIN_URL} -> #{FILE_PATH}\n\n"
    system 'wget', ORIGIN_URL, "-O", FILE_PATH
    puts "Mousetrap.js updated!"
  end
end
