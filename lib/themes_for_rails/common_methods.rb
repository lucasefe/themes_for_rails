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

    def set_theme(name)
      self.theme_name = name

      if valid_theme?
        add_theme_view_path
        add_theme_assets_path
      end
    end

  protected

    # Check theme is valid
    def valid_theme?
      !self.theme_name.nil?
    end

    # Add view path for current theme
    def add_theme_view_path
      self.view_paths.insert 0, ActionView::FileSystemResolver.new("#{ThemesForRails.config.themes_dir}/#{self.theme_name}/views")
    end

    # Add assets path for current theme
    def add_theme_assets_path
      assets_dir = File.join(Rails.root.to_s, ThemesForRails.config.themes_dir, self.theme_name, 'assets')

      [:stylesheets, :javascripts, :images].each do |asset_type|
        Rails.application.assets.append_path(File.join(assets_dir, asset_type.to_s))
      end
    end
  end
end