module ThemesForRails
  module UrlHelpers
    extend ActiveSupport::Concern
    included do
      include ThemesForRails::CommonMethods
      helper_method :current_theme_stylesheet_path, 
        :current_theme_javascript_path, 
        :current_theme_image_path
    end
    module InstanceMethods
      def current_theme_stylesheet_path(asset)
        base_theme_stylesheet_path(:theme => self.theme_name, :asset => "#{asset}.css")
      end
      def current_theme_javascript_path(asset)
        base_theme_javascript_path(:theme => self.theme_name, :asset => "#{asset}.js")
      end
      def current_theme_image_path(asset)
        image, extension = asset.split(".")
        base_theme_image_path(:theme => self.theme_name, :asset => "#{image}.#{extension}")
      end
    end
  end
end