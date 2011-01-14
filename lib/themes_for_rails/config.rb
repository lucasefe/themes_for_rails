module ThemesForRails
  class Config

    attr_writer :base_dir, :themes_dir
    attr_accessor :use_sass
    
    def initialize(&block)
      @use_sass = false
      yield if block_given?
    end
    
    def base_dir
      @base_dir ||= Rails.root
    end
    
    def themes_dir
      @themes_dir ||= "themes"
    end
    
    def clear
      @base_dir = nil
      @themes_dir = nil
    end

    def use_sass?
      @use_sass and defined?Sass::Plugin
    end

  end  
end