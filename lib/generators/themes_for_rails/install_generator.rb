module ThemesForRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a ThemeForRails basic structure."

      def create_themes_folder
        empty_directory(ThemesForRails.config.themes_path)
      end
      
      def add_themes_for_rails_routes
        route "themes_for_rails"
      end
      
    end
  end
end