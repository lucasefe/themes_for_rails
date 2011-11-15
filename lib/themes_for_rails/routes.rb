require 'themes_for_rails/assets'

module ThemesForRails
  module Routes
    def themes_for_rails
      match "/themes/:theme/assets/*asset" => ThemesForRails::Assets.new
    end
  end
end

module ActionDispatch::Routing
  class Mapper #:nodoc:
    include ThemesForRails::Routes
  end
end
