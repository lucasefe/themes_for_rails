module ThemesForRails
  module ViewHelpers
    extend ActiveSupport::Concern
    included do
      include ThemesForRails::CommonMethods
    end
    module InstanceMethods
      def current_theme_stylesheet_path(asset)
        base_theme_stylesheet_path(:theme => self.theme_name, :asset => "#{asset}.css")
      end
      def current_theme_javascript_path(asset)
        base_theme_javascript_path(:theme => self.theme_name, :asset => "#{asset}.js")
      end
      def current_theme_image_path(asset)
        self.base_theme_image_path(:theme => self.theme_name, :asset => asset)
      end
      alias_method :theme_image_path, :current_theme_image_path
      alias_method :theme_javascript_path, :current_theme_javascript_path
      alias_method :theme_stylesheet_path, :current_theme_stylesheet_path

      def theme_image_tag(source)
        image_tag(theme_image_path(source))
      end
      def theme_javascript_include_tag(*files)
        files.collect! {|file| theme_javascript_path(file) }
        javascript_include_tag *files
      end
      def theme_stylesheet_link_tag(*files)
        files.collect! {|file| theme_stylesheet_path(file) }
        stylesheet_link_tag *files
      end
    end
  end
end

ActiveSupport.on_load(:action_view) { include ThemesForRails::ViewHelpers }
