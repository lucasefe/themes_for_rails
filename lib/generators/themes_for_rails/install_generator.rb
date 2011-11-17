module ThemesForRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates a ThemeForRails themes folder with default theme inside."

      def create_themes_folder
        empty_directory ThemesForRails.config.themes_path
        create_file "#{ThemesForRails.config.themes_path}/.gitkeep", ""
        inject_into_class "app/controllers/application_controller.rb", ApplicationController do
          "  theme 'default'\n"
        end

        if yes?("\nMove all your views and assets to #{ThemesForRails.config.themes_path}/default (y/n)?")
          # Create empty directory for default themes
          default_theme_dir = "#{ThemesForRails.config.themes_path}/default"
          empty_directory default_theme_dir

          # TODO: need check for git (or git repo?). If git available, move with git mv command
          run "mv ./app/views/ #{default_theme_dir}"
          run "mv ./app/assets/ #{default_theme_dir}"
        else
          generate 'themes_for_rails:theme default'
        end

        readme 'README'
      end
      
    end
  end
end