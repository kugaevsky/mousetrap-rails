require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

ORIGIN_URL  = "https://raw.github.com/ccampbell/mousetrap/master"
BASE_FILE_PATH   = "vendor/assets/javascripts"

namespace :mousetrap do
  desc "Update main mousetrap javascript lib and its plugins"
  task :update do
    %w(main plugins).each do |task|
      Rake::Task["mousetrap:update:#{task}"].invoke
    end
  end

  namespace :update do
    desc "Update main mousetrap javascript lib"
    task :main do
      origin_url  = "#{ORIGIN_URL}/mousetrap.js"
      file_path   = "#{BASE_FILE_PATH}/mousetrap.js"
      download origin_url, file_path
      puts "\033[32m-> Main mousetrap lib updated!\033[0m\n\n"
    end

    desc "Update mousetrap javascript lib plugins"
    task :plugins do
      plugins = { dictionary: 'plugins/bind-dictionary/mousetrap-bind-dictionary.js',
                  global:     'plugins/global-bind/mousetrap-global-bind.js',
                  pause:      'plugins/pause/mousetrap-pause.js',
                  record:     'plugins/record/mousetrap-record.js'
                  }
      plugins.each_pair do |name, file|
        origin_url  = "#{ORIGIN_URL}/#{file}"
        file_path   = "#{BASE_FILE_PATH}/mousetrap/#{name}.js"
        download origin_url, file_path
        puts "\033[32m-> #{name} mousetrap plugin updated!\033[0m\n\n"
      end
    end
  end
end

def download(source, dest)
  system 'wget', source, "-O", dest
end
