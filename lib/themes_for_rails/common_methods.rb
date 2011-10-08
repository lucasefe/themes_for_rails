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

    def set_theme(name)
      self.theme_name = name

      if valid_theme?
        add_theme_view_path
      end
    end

  public

    def valid_theme?
      !self.theme_name.nil?
    end

    # will add the view path for the current theme
    def add_theme_view_path
      add_assets_path_for(self.theme_name)
      add_theme_view_path_for(self.theme_name)
    end

    # will add the view path for a given theme name
    def add_theme_view_path_for(name)
      self.view_paths.insert 0, ActionView::FileSystemResolver.new(view_path_for(name))
    end

    # Add paths for Sprockets
    def add_assets_path_for(name)
      assets_dir = File.join(ThemesForRails.config.base_dir, ThemesForRails.config.themes_dir, name, 'assets')

      [:stylesheets, :javascripts, :images].each do |asset_type|
        Rails.application.assets.append_path(File.join(assets_dir, asset_type.to_s))
      end
    end

    def public_theme_path
      theme_path("/")
    end

    def theme_path(base = ThemesForRails.config.base_dir)
      theme_path_for(theme_name, base)
    end

    def theme_path_for(name, base = ThemesForRails.config.base_dir, theme_dir = ThemesForRails.config.themes_dir)
      File.join(base, theme_dir, name)
    end
  end
end