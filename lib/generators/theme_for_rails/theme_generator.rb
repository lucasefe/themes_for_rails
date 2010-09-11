module ThemeForRails
  module Generators
    class ThemeGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates an empty theme."
      
      def create_theme
        theme_dir = File.join(themes_path, name)
        directory  'theme', theme_dir
      end
    private
      def themes_path
        File.join(Rails.root, "themes")
      end
    end
  end
end