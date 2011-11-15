require 'themes_for_rails/railtie'

module ThemesForRails
  extend ActiveSupport::Autoload

  autoload :Config
  autoload :CommonMethods
  autoload :ControllerMethods
  autoload :MailerMethods
  autoload :Railtie
  autoload :Version

  class << self
    def config
      @config ||= ThemesForRails::Config.new
      yield(@config) if block_given?
      @config
    end

    def available_themes(&block)
      Dir.glob(File.join(config.themes_dir, "*"), &block)
    end

    alias each_theme_dir available_themes

    def available_theme_names
      available_themes.map {|theme| File.basename(theme) } 
    end
  end
end

require 'themes_for_rails/routes'
require 'themes_for_rails/controller_methods'
require 'themes_for_rails/mailer_methods'
