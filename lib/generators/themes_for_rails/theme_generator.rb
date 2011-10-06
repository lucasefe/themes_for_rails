module ThemesForRails
  module Generators
    class ThemeGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates an empty theme."
      
      def create_theme
        theme_dir = File.join(ThemesForRails.config.themes_path, name)
        directory 'theme', theme_dir
      end
    end
  end
end