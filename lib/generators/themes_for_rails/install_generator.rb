module ThemesForRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a ThemeForRails basic structure."

      def create_themes_folder
        empty_directory ThemesForRails.config.themes_path
        create_file "#{ThemesForRails.config.themes_path}/.gitkeep", ""
      end
      
    end
  end
end