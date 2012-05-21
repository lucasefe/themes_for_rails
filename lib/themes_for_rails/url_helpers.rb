# encoding: utf-8
module ThemesForRails
  module UrlHelpers

    extend ActiveSupport::Concern

    included do
      helper_method :current_theme_stylesheet_path,
        :current_theme_javascript_path,
        :current_theme_image_path
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

  end
end