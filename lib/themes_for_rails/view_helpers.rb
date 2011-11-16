module ThemesForRails
  module ViewHelpers

    extend ActiveSupport::Concern

    included do
      include ThemesForRails::CommonMethods
    end

    module InstanceMethods
      def current_theme_asset_path(asset)
        theme_asset_path(asset, self.theme_name)
      end
      alias_method :current_theme_javascript_path, :current_theme_asset_path
      alias_method :current_theme_stylesheet_path, :current_theme_asset_path
      alias_method :current_theme_image_path,      :current_theme_asset_path

      def theme_asset_path(asset, new_theme_name = self.theme_name, options = {})
        asset_path("/themes/#{new_theme_name}/assets/#{asset}", options)
      end
      alias_method :theme_image_path, :theme_asset_path
      alias_method :theme_javascript_path, :theme_asset_path
      alias_method :theme_stylesheet_path, :theme_asset_path

      def current_theme_image_tag(source, options = {})
        image_tag(current_theme_image_path(source), options)
      end

      def theme_image_tag(source, new_theme_name = self.theme_name, options = {})
        image_tag(theme_image_path(source, new_theme_name), options)
      end

      def theme_javascript_include_tag(*files)
        options = files.extract_options!
        files.collect! {|file| theme_javascript_path(file) }
        files << options
        javascript_include_tag *files
      end

      def theme_stylesheet_link_tag(*files)
        options = files.extract_options!
        files.collect! {|file| theme_stylesheet_path(file) }
        files << options
        stylesheet_link_tag(*files)
      end
    end
  end
end

ActiveSupport.on_load(:action_view) { include ThemesForRails::ViewHelpers }


