# encoding: utf-8
module ThemesForRails
  module Routes

    def themes_for_rails
      theme_dir = ThemesForRails.config.themes_routes_dir
      constraints = { :theme => /[\w\.]*/ } 
      
      # Lets not pollute the routes if they aren't being used.
      unless ThemesForRails.config.asset_digests_enabled?
        match "#{theme_dir}/:theme/stylesheets/*asset" => 'themes_for_rails/assets#stylesheets',
          :as => :base_theme_stylesheet, :constraints => constraints
        match "#{theme_dir}/:theme/javascripts/*asset" => 'themes_for_rails/assets#javascripts',
          :as => :base_theme_javascript, :constraints => constraints
        match "#{theme_dir}/:theme/images/*asset" => 'themes_for_rails/assets#images',
          :as => :base_theme_image, :constraints => constraints
      end
    end

  end
end

module ActionDispatch::Routing
  class Mapper #:nodoc:

    include ThemesForRails::Routes

  end
end

