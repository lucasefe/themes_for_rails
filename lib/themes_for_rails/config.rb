module ThemesForRails
  class Config
    attr_writer :themes_dir #:base_dir,
    #attr_accessor :use_sass
    
    def initialize(&block)
      #@use_sass = true
      yield if block_given?
    end
    
    #def base_dir
    #  @base_dir ||= Rails.root
    #end
    
    def themes_dir
      @themes_dir ||= "app/themes"
      @themes_dir = File.join(Rails.root, @themes_dir)
      @themes_dir
    end
    
    #def themes_path
    #  File.join(Rails.root, themes_dir)
    #end
    
    def clear
      #@base_dir   = nil
      @themes_dir = nil
    end
  end  
end