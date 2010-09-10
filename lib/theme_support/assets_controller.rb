require "action_controller/metal"

module ThemeSupport
  class AssetsController < ActionController::Base
    include ThemeSupport::HelperMethods
    def stylesheets
      render theme_stylesheet_path(params[:theme], params[:asset])
    end
    def javascripts
      render theme_javascript_path(params[:theme], params[:asset])
    end
    def images
      render theme_image_path(params[:theme], params[:asset])
    end
  end
end