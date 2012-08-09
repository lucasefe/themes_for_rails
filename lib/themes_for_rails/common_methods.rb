# encoding: utf-8
module ThemesForRails
  module CommonMethods

    include ThemesForRails::Interpolation

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
      add_theme_view_path_for(self.theme_name)
    end

    # will add the view path for a given theme name
    def add_theme_view_path_for(name)
      self.view_paths.insert 0, ::ActionView::FileSystemResolver.new(theme_view_path_for(name))
    end

    def digest_for_image(asset, theme_context)
      if ThemesForRails.config.asset_digests_enabled?
        Rails.application.config.assets.digests["#{theme_context}/images/#{asset}"] || asset
      else
        asset
      end
    end

    def digest_for_javascript(asset, theme_context)
      if ThemesForRails.config.asset_digests_enabled?
        Rails.application.config.assets.digests["#{theme_context}/javascripts/#{asset}"] || asset
      else
        asset
      end
    end

    def digest_for_stylesheet(asset, theme_context)
      if ThemesForRails.config.asset_digests_enabled?
        Rails.application.config.assets.digests["#{theme_context}/stylesheets/#{asset}"] || asset
      else
        asset
      end
    end

    def name_ext(file_name)
      ext = File.extname(file_name)
      name = File.basename(file_name, ext)
      ext.slice!(0) if ext.length > 0
      return name, ext
    end

    def public_theme_path
      theme_view_path("/")
    end

    def theme_asset_path
      theme_asset_path_for(theme_name)
    end

    def theme_view_path
      theme_view_path_for(theme_name)
    end

    def theme_view_path_for(theme_name)
      interpolate(ThemesForRails.config.views_dir, theme_name)
    end

    def theme_asset_path_for(theme_name)
      interpolate(ThemesForRails.config.assets_dir, theme_name)
    end
  end
end