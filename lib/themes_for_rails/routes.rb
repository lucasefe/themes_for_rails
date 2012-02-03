# encoding: utf-8
module ThemesForRails
  module Routes

    def themes_for_rails
      theme_dir = ThemesForRails.config.themes_dir
      constraints = { :theme => /[\w\.]*/ } 

      match "#{theme_dir}/:theme(/:assets_prefix)/stylesheets/*asset" => 'themes_for_rails/assets#stylesheets', 
        :as => :base_theme_stylesheet, :constraints => constraints

      match "#{theme_dir}/:theme(/:assets_prefix)/javascripts/*asset" => 'themes_for_rails/assets#javascripts', 
        :as => :base_theme_javascript, :constraints => constraints
      
      match "#{theme_dir}/:theme(/:assets_prefix)/images/*asset" => 'themes_for_rails/assets#images', 
        :as => :base_theme_image, :constraints => constraints
        

    end

  end
end

module ActionDispatch::Routing
  class Mapper #:nodoc:

    include ThemesForRails::Routes

  end
end

