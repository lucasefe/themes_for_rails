module ThemesForRails
  class Config

    attr_writer :base_dir, :themes_dir
    
    def initialize(&block)
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

  end  
end