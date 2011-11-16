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

      def theme_asset_path(asset, new_theme_name = self.theme_name, options = {})
        asset_path("/themes/#{new_theme_name}/assets/#{asset}", options)
      end

      def current_theme_stylesheet_path(asset)
        if Rails.application.config.assets.enabled
          current_theme_asset_path(asset)
        else
          base_theme_stylesheet_path(:theme => self.theme_name, :asset => "#{asset}.css")
        end
      end

      def current_theme_javascript_path(asset)
        if Rails.application.config.assets.enabled
          current_theme_asset_path(asset)
        else
          base_theme_stylesheet_path(:theme => self.theme_name, :asset => "#{asset}.css")
        end
      end

      def current_theme_image_path(asset)
        if Rails.application.config.assets.enabled
          current_theme_asset_path(asset)
        else
          base_theme_image_path(:theme => self.theme_name, :asset => asset)
        end
      end

      def theme_stylesheet_path(asset, new_theme_name = self.theme_name)
        if Rails.application.config.assets.enabled
          theme_asset_path(asset, new_theme_name)
        else
          base_theme_stylesheet_path(:theme => new_theme_name, :asset => "#{asset}.css")
        end
      end

      def theme_javascript_path(asset, new_theme_name = self.theme_name)
        if Rails.application.config.assets.enabled
          theme_asset_path(asset, new_theme_name)
        else
          base_theme_javascript_path(:theme => new_theme_name, :asset => "#{asset}.js")
        end
      end

      def theme_image_path(asset, new_theme_name = self.theme_name)
        if Rails.application.config.assets.enabled
          theme_asset_path(asset, new_theme_name)
        else
          base_theme_image_path(:theme => new_theme_name, :asset => asset)
        end
      end

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


