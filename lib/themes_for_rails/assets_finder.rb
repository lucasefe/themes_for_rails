require 'sprockets'

# Extends Sprockets::Environment functionality in order
# to support theming

module ThemesForRails::AssetsFinder
  
  THEME_REGEX_MATCHER = /themes\/([a-zA-Z\-_]*)\/assets\/(.*)/

  include ThemesForRails::CommonMethods
  include ThemesForRails::Logging

  def find_asset(path, options = {})
    _, theme, asset_name = *THEME_REGEX_MATCHER.match(path)

    unless theme.nil?
      log "Asset Name: #{asset_name}"
      log "Selected Theme: #{theme}"
      self.theme_name = theme
      log "Adding Theme Path to Sprockets Path list. "
      add_theme_assets_path
      super(asset_name, options)
    else
      super
    end
  end

  def add_theme_assets_path
    @@theme_assets_path_cache ||= begin
      [:stylesheets, :javascripts, :images].each do |asset_type|
        prepend_path(assets_path_for(self.theme_name, asset_type.to_s))
      end
      true
    end
  end

  # Generate path for assets by theme name and asset type
  def assets_path_for(theme_name, asset_type)
    File.join(ThemesForRails.config.themes_dir, theme_name, 'assets', asset_type.to_s)
  end

end


