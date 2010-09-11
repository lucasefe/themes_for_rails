require "action_controller/metal"

module ThemesForRails
  class AssetsController < ActionController::Base
    include ThemesForRails::CommonMethods
    include ThemesForRails::UrlHelpers
    def stylesheets
      render_asset theme_stylesheet_path(params[:theme], params[:asset])
    end
    def javascripts
      render_asset theme_javascript_path(params[:theme], params[:asset])
    end
    def images
      render_asset theme_image_path(params[:theme], params[:asset], params[:extension])
    end
  private
    def render_asset(asset)
      unless File.exists?(asset)
        render :text => 'not found', :status => 404
      else
        render asset
      end
    end
  end
end