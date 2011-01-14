module ThemesForRails
  class << self

    def config
      @config ||= ThemesForRails::Config.new
      yield(@config) if block_given?
      @config
    end
    
    def available_themes
      Dir.glob(File.join(config.base_dir, config.themes_dir, "*"))
    end
    
    def available_theme_names
      available_themes.map {|theme| File.basename(theme) } 
    end
    
    def add_themes_path_to_sass
      each_theme_dir do |dir|
        if File.directory?(dir) # Need to get rid of the '.' and '..'
          Sass::Plugin.add_template_location "#{dir}/stylesheets/sass", "#{dir}/stylesheets"
        end
      end
    end
    
    def each_theme_dir
      Dir.glob(File.join(Rails.root, config.themes_dir, "*")) do |theme_dir|
        yield(theme_dir) if block_given?
      end
    end
  end
end

require 'active_support/dependencies'
require 'themes_for_rails/config'
require 'themes_for_rails/common_methods'
require 'themes_for_rails/url_helpers'
require 'themes_for_rails/view_helpers'
require 'themes_for_rails/assets_controller'
require 'themes_for_rails/controller_methods'
require 'themes_for_rails/railtie'
require 'themes_for_rails/routes'
require 'themes_for_rails/version'
