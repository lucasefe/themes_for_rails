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
    
    def base_dir
      @base_dir ||= Rails.root
    end
    
    # relative assets dir for view overloading support
    # used for theme_path_for method to get theme path and add to view paths
    #
    # If you are using the Rails Asset Pipeline, this should be changed to the 
    # path of your assets in your app. For example, if you store your themes
    # under /app/assets/themes - {Rails.root}/app/assets/themes
    # you would need to set this to 'app/assets/themes' in your initializer config
    def assets_dir
      @assets_dir ||= "themes"
    end
    
    # This is the base themes dir that is used for mapping URL paths.
    # 
    # If you are using the Rails Asset Pipeline, this should be changed to the
    # prefix dir of your assets path. For example, if you store your themes
    # under /app/assets/themes - {Rails.root}/app/assets/themes
    # you would need to set this value to 'assets' to match up with the Sprockets
    # path resolution process.
    def themes_dir
      @themes_dir ||= "themes"
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