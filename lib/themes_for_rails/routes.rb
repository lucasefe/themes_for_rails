# encoding: utf-8
module ThemesForRails
  module Routes

    def themes_for_rails
      theme_dir = ThemesForRails.config.themes_routes_dir
      constraints = { :theme => /[\w\.]*/ } 
      
      match "#{theme_dir}/:theme/stylesheets/*asset" => 'themes_for_rails/assets#stylesheets', :via => [:get],
        :as => :base_theme_stylesheet, :constraints => constraints
      match "#{theme_dir}/:theme/javascripts/*asset" => 'themes_for_rails/assets#javascripts', :via => [:get],
        :as => :base_theme_javascript, :constraints => constraints
      match "#{theme_dir}/:theme/images/*asset" => 'themes_for_rails/assets#images', :via => [:get],
        :as => :base_theme_image, :constraints => constraints
    end

  end
end

module ActionDispatch::Routing
  class Mapper #:nodoc:

    include ThemesForRails::Routes

  end
end

