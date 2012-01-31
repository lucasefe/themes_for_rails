# encoding: utf-8
module ThemesForRails

  class << self

    def config
      @config ||= ThemesForRails::Config.new
      yield(@config) if block_given?
      @config
    end
    
    def available_themes(&block)
      Dir.glob(File.join(config.themes_path, "*"), &block) 
    end
    alias each_theme_dir available_themes
    
    def available_theme_names
      available_themes.map {|theme| File.basename(theme) } 
    end
    
    def add_themes_path_to_sass
      if ThemesForRails.config.sass_is_available?
        each_theme_dir do |dir|
          if File.directory?(dir) # Need to get rid of the '.' and '..'

            sass_dir = "#{dir}/stylesheets/sass"
            css_dir = "#{dir}/stylesheets"

            unless already_configured_in_sass?(sass_dir)
              Sass::Plugin.add_template_location sass_dir, css_dir 
            end
          end
        end 
      else
        raise "Sass is not available. What are you trying to do?"
      end
    end
    
    def already_configured_in_sass?(sass_dir)
      Sass::Plugin.template_location_array.map(&:first).include?(sass_dir)
    end
    
  end
end

require 'active_support/dependencies'
require 'themes_for_rails/config'
require 'themes_for_rails/common_methods'
require 'themes_for_rails/url_helpers'

require 'themes_for_rails/action_view'
require 'themes_for_rails/assets_controller'
require 'themes_for_rails/action_controller'
require 'themes_for_rails/action_mailer'
require 'themes_for_rails/railtie'
require 'themes_for_rails/routes'

