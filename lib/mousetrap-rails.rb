require "mousetrap-rails/version"

# Mousetrap main module
module Mousetrap

  # Mousetrap rails module
  # Require railtie or engine depending of rails version
  module Rails
    if ::Rails.version < "3.1"
      require "mousetrap-rails/railtie"
    else
      require "mousetrap-rails/engine"
    end
  end
end
