require 'themes_for_rails/assets_finder'

module ThemesForRails
  module Routes
    def themes_for_rails
      match "/themes/:theme/assets/*asset" => ThemesForRails.config.assets_finder
    end
  end
end

module ActionDispatch::Routing
  class Mapper #:nodoc:
    include ThemesForRails::Routes
  end
end
