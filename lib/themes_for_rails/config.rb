module ThemesForRails
  class Config
    def initialize(&block)
      yield if block_given?
    end

    def assets_finder
      Rails.application.assets
    end

    def themes_dir=(path)
      @themes_dir = File.join(Rails.root, path)
    end
    
    def themes_dir
      @themes_dir ||= File.join(Rails.root, "app/themes")
    end

    def clear
      @themes_dir = nil
    end
  end  
end
