require 'themes_for_rails/sprockets_environment'

module ThemesForRails
  module Routes
    def themes_for_rails
     # theme_dir = ThemesForRails.config.themes_dir
     # match "#{theme_dir}/:theme/stylesheets/*asset" => 'themes_for_rails/assets#stylesheets', :as => :base_theme_stylesheet
     # match "#{theme_dir}/:theme/javascripts/*asset" => 'themes_for_rails/assets#javascripts', :as => :base_theme_javascript
     # match "#{theme_dir}/:theme/images/*asset" => 'themes_for_rails/assets#images', :as => :base_theme_image
      match "/themes/:theme/assets/*asset" => ThemesForRails::SprocketsEnvironment.new
    end
  end
end

module ActionDispatch::Routing
  class Mapper #:nodoc:
    include ThemesForRails::Routes
  end
end
