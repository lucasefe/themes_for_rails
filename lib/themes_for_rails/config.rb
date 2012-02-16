# encoding: utf-8
module ThemesForRails
  class Config

    attr_writer :base_dir, :themes_dir, :assets_dir
    attr_accessor :use_sass, :default_theme
    
    def initialize(&block)
      @use_sass = true
      @default_theme = 'default'
      yield if block_given?
    end
    
    # Rails Root: /vagrant/web
    def base_dir
      @base_dir ||= Rails.root
    end
    
    # relative assets dir for asset pipeline: /vagrant/web/app/ {assets} /themes/ {theme}
    def assets_dir
      @assets_dir ||= "assets"
    end
    
    # Themes Dir (relative path to themes from base_dir): app/assets/themes
    def themes_dir
      @themes_dir ||= "app/assets/themes"
    end
    
    # Full path to themes
    def themes_path
      File.join(base_dir, themes_dir)
    end
    
    def clear
      @base_dir = nil
      @themes_dir = nil
      @assets_dir = nil
    end

    def use_sass?
      @use_sass and sass_is_available?
    end

    def sass_is_available?
      !!defined?Sass::Plugin
    end
  end  
end