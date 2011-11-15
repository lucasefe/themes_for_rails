module ThemesForRails
  module CommonMethods
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
      File.join(ThemesForRails.config.themes_dir, theme_name, 'assets', asset_type.to_s)
    end

    # Check theme is valid
    def valid_theme?
      !self.theme_name.nil?
    end

    # Add view path for current theme
    def add_theme_view_path
      prepend_view_path(ActionView::FileSystemResolver.new(views_path_for(self.theme_name)))
    end

    def views_path_for(theme_name)
      File.join(ThemesForRails.config.themes_dir, theme_name, 'views')
    end
  end
end
