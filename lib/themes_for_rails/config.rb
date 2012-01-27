# encoding: utf-8
module ThemesForRails
  class Config

    attr_writer :base_dir, :themes_dir, :assets_prefix
    attr_accessor :use_sass
    
    def initialize(&block)
      @use_sass = true
      yield if block_given?
    end
    
    def base_dir
      @base_dir ||= Rails.root
    end
    
    def themes_dir
      @themes_dir ||= "themes"
    end
    
    def themes_path
      File.join(base_dir, themes_dir)
    end
    
    def clear
      @base_dir = nil
      @themes_dir = nil
      @assets_prefix = nil
    end

    def assets_prefix
      @assets_prefix.blank? ? nil :   @assets_prefix
    end

    def use_sass?
      @use_sass and sass_is_available?
    end

    def sass_is_available?
      !!defined?Sass::Plugin
    end
  end  
end