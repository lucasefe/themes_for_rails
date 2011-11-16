module ThemesForRails
  class Config

    attr_writer :base_dir

    def initialize(&block)
      yield if block_given?
    end

    def assets_finder
      Rails.application.assets
    end

    def base_dir
      @base_dir ||= Rails.root
    end

    def themes_dir=(path)
      @themes_dir = path
    end

    def themes_dir
      @themes_dir ||= "app/themes"
    end

    def themes_path
      File.join(base_dir, themes_dir)
    end

    def clear
      @themes_dir = nil
    end
  end  
end
