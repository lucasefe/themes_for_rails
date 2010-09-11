module ThemeForRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a ThemeForRails basic structure."

      def create_themes_folder
        empty_directory(File.join(Rails.root, 'themes'))
      end
    end
  end
end