module ThemesForRails
  module CommonMethods
    def view_path_for(theme)
      File.join(theme_path_for(theme), "views")
    end

    def theme_name
      @cached_theme_name ||= begin
        case @theme_name
        when Symbol then
          self.respond_to?(@theme_name, true) ? self.send(@theme_name) : @theme_name.to_s
        when String then @theme_name
        else
          nil
        end
      end
    end

    def theme_name=(name)
      @theme_name = name
    end

    # This calls from ControllerMethods module
    def set_theme(name)
      self.theme_name = name

      if valid_theme?
        add_theme_view_path
      end
    end

  protected

    # Generate path for assets by theme name and asset type
    def assets_path_for(theme_name, asset_type)
      File.join(ThemesForRails.config.themes_path, theme_name, 'assets', asset_type.to_s)
    end

    # Check theme is valid
    def valid_theme?
      !self.theme_name.nil?
    end

    # Add view path for current theme
    def add_theme_view_path
      if Rails.application.config.assets.enabled
        prepend_view_path(ActionView::FileSystemResolver.new(views_path_for(self.theme_name)))
      else
        add_theme_view_path_for(self.theme_name)
      end
    end

    def add_theme_view_path_for(name)
      self.view_paths.insert 0, ActionView::FileSystemResolver.new(view_path_for(name))
    end

    def views_path_for(theme_name)
      File.join(ThemesForRails.config.themes_path, theme_name, 'views')
    end

    def theme_path(base = ThemesForRails.config.base_dir)
      theme_path_for(theme_name, base)
    end

    def theme_path_for(name, base = ThemesForRails.config.base_dir, theme_dir = ThemesForRails.config.themes_dir)
      File.join(base, theme_dir, name)
    end
    
    def add_theme_assets_path
      @@theme_assets_path_cache ||= begin
        [:stylesheets, :javascripts, :images].each do |asset_type|
          Rails.application.assets.prepend_path(assets_path_for(self.theme_name, asset_type.to_s))
        end
        true
      end
    end
  end
end
