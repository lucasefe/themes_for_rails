# encoding: utf-8
module ThemesForRails

  module DigestedActionView

    extend ActiveSupport::Concern

    included do
      include ThemesForRails::CommonMethods
    end

    def current_theme_stylesheet_path(asset)
      digest_for_stylesheet("#{asset}.css", self.theme_name)
    end

    def current_theme_javascript_path(asset)
      digest_for_javascript("#{asset}.js", self.theme_name)
    end

    def current_theme_image_path(asset)
      image, extension = name_ext(asset)
      digest_for_image("#{image}.#{extension}", self.theme_name)
    end

    def theme_stylesheet_path(asset, new_theme_name = self.theme_name)
      digest_for_stylesheet("#{asset}.css", new_theme_name)
    end

    def theme_javascript_path(asset, new_theme_name = self.theme_name)
      digest_for_javascript("#{asset}.js", new_theme_name)
    end

    def theme_image_path(asset, new_theme_name = self.theme_name)
      image, extension = name_ext(asset)
      digest_for_image("#{image}.#{extension}", new_theme_name)
    end

    def theme_image_tag(source, options = {})
      image_tag(theme_image_path("#{source}", self.theme_name), options)
    end

    def theme_image_submit_tag(source, options = {})
      image, extension = name_ext(source)
      image_submit_tag(theme_image_path("#{image}.#{extension}", self.theme_name), options)
    end

    def theme_javascript_include_tag(*files)
      options = files.extract_options!
      options.merge!({ :type => "text/javascript" })
      files_with_options = files.collect {|file| theme_javascript_path(file) }
      files_with_options += [options]

      javascript_include_tag(*files_with_options)
    end

    def theme_stylesheet_link_tag(*files)
      options = files.extract_options!
      options.merge!({ :type => "text/css" })
      files_with_options = files.collect {|file| theme_stylesheet_path(file) }
      files_with_options += [options]

      stylesheet_link_tag(*files_with_options)
    end
  end
end
