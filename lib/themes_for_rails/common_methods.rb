module ThemesForRails
  module CommonMethods
    def view_path_for(theme)
      File.join(theme_path_for(theme), "views")
    end
    def theme_name
      case @theme_name
      when Symbol then self.send(@theme_name)
      when String then @theme_name
      else
        nil
      end
    end
    def theme_name=(name)
      @theme_name = name
    end
    def set_theme(name)
      self.theme_name = name
      add_theme_view_path_for(self.theme_name)
    end
    def add_theme_view_path_for(theme_name)
      self.view_paths << ActionView::FileSystemResolver.new(view_path_for(theme_name))
    end
    
    def theme_path_for(theme_name, base = ::Rails.root)
      File.join(base, "themes", theme_name.to_s)
    end
    
    def theme_stylesheet_path(theme, asset)
      File.join(theme_path_for(theme), 'stylesheets', "#{asset}.css")
    end
    def theme_javascript_path(theme, asset)
      File.join(theme_path_for(theme), 'javascripts', "#{asset}.js")
    end
    def theme_image_path(theme, asset, extension = nil)
      extension ||= "png"
      extension = ".#{extension}"
      File.join(theme_path_for(theme), 'images', "#{asset}#{extension}")
    end
    
  end
end