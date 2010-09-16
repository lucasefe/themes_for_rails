module ThemesForRails
  class << self
    attr_writer :base_dir
    def base_dir
      @base_dir ||= Rails.root
    end
    def available_themes
      Dir.glob("#{base_dir}/themes/*")
    end
    def available_theme_names
      @available_theme_names ||= available_themes.map {|theme| File.basename(theme) } 
    end
  end
end

require 'active_support/dependencies'
require 'themes_for_rails/common_methods'
require 'themes_for_rails/url_helpers'
require 'themes_for_rails/view_helpers'
require 'themes_for_rails/assets_controller'
require 'themes_for_rails/controller_methods'
require 'themes_for_rails/railtie'
require 'themes_for_rails/routes'
require 'themes_for_rails/version'
