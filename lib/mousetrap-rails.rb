require "mousetrap-rails/version"

module Mousetrap
  module Rails
    if ::Rails.version < "3.1"
      require "mousetrap-rails/railtie"
    else
      require "mousetrap-rails/engine"
    end
  end
end
