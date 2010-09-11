module ThemesForRails
  module CommonMethods
    def view_path_for(theme)
      File.join(theme_path_for(theme), "views")
    end
    def theme_name
      @cached_theme_name ||= begin
        case @theme_name
        when Symbol then self.send(@theme_name)
        when String then @theme_name
        else
          nil
        end
      end
    end
    def theme_name=(name)
      @theme_name = name
    end
    def set_theme(name)
      self.theme_name = name    
      add_theme_view_path unless self.theme_name.nil?
    end
    # will add the view path for the current theme
    def add_theme_view_path
      add_theme_view_path_for(self.theme_name)
    end
    # will add the view path for a given theme name
    def add_theme_view_path_for(name)
      self.view_paths << ActionView::FileSystemResolver.new(view_path_for(name))
    end
    
    def theme_path_for(name, base = ::Rails.root)
      File.join(base, "themes", name.to_s)
    end
    
    def theme_stylesheet_path(name, asset)
      File.join(theme_path_for(name), 'stylesheets', "#{asset}.css")
    end
    def theme_javascript_path(name, asset)
      File.join(theme_path_for(name), 'javascripts', "#{asset}.js")
    end
    def theme_image_path(name, asset, extension = nil)
      extension ||= "png"
      extension = ".#{extension}"
      File.join(theme_path_for(name), 'images', "#{asset}#{extension}")
    end
    
  end
end