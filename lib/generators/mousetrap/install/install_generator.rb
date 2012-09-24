module Mousetrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Copy Mousetrap default files"
      source_root File.expand_path('../templates', __FILE__)

      def copy_mousetrap
        copy_file "keybindings.js.coffee", "app/assets/javascripts/keybindings.js.coffee"
      end

      def add_javascript_assets
        if File.exist?('app/assets/javascripts/application.js')
          insert_into_file "app/assets/javascripts/application.js", "//= require mousetrap\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", "app/assets/javascripts/application.js"
        end
      end

      def add_css_assets
        if File.exist?('app/assets/stylesheets/application.css')
          insert_into_file "app/assets/stylesheets/application.css", "*= require mousetrap\n ", :before => "*= require_tree ."
        else
          copy_file "application.css", "app/assets/stylesheets/application.css"
        end
      end
    end
  end
end
