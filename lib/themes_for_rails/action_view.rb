# encoding: utf-8
module ThemesForRails

  module ActionView

    extend ActiveSupport::Concern

    included do
      include ThemesForRails::CommonMethods
    end

    def current_theme_stylesheet_path(asset)
      base_theme_stylesheet_path(:theme => self.theme_name, :asset => digest_for("#{asset}.css"))
    end

    def current_theme_javascript_path(asset)
      base_theme_javascript_path(:theme => self.theme_name, :asset => digest_for("#{asset}.js"))
    end

    def current_theme_image_path(asset)
      image, extension = name_ext(asset)
      base_theme_image_path(:theme => self.theme_name, :asset => digest_for("#{image}.#{extension}"))
    end

    def theme_stylesheet_path(asset, new_theme_name = self.theme_name)
      base_theme_stylesheet_path(:theme => new_theme_name, :asset => digest_for("#{asset}.css"))
    end

    def theme_javascript_path(asset, new_theme_name = self.theme_name)
      base_theme_javascript_path(:theme => new_theme_name, :asset => digest_for("#{asset}.js"))
    end

    def theme_image_path(asset, new_theme_name = self.theme_name)
      image, extension = name_ext(asset)
      base_theme_image_path(:theme => new_theme_name, :asset => digest_for("#{image}.#{extension}"))
    end

    def theme_image_tag(source, options = {})
      image, extension = name_ext(source)
      image_tag(theme_image_path(digest_for("#{image}.#{extension}")), options)
    end

    def theme_image_submit_tag(source, options = {})
      image, extension = name_ext(source)
      image_submit_tag(theme_image_path(digest_for("#{image}.#{extension}")), options)
    end

    def theme_javascript_include_tag(*files)
      options = files.extract_options!
      options.merge!({ :type => "text/javascript" })
      files.collect! {|file| theme_javascript_path(file) }
      javascript_include_tag(*files, options)
    end

    def theme_stylesheet_link_tag(*files)
      options = files.extract_options!
      options.merge!({ :type => "text/css" })
      files.collect! {|file| theme_stylesheet_path(file) }
      stylesheet_link_tag(*files, options)
    end
  end
end

