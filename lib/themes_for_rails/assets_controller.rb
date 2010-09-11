require "action_controller/metal"

module ThemesForRails
  class AssetsController < ActionController::Base
    include ThemesForRails::CommonMethods
    include ThemesForRails::UrlHelpers
    def stylesheets
      render_asset theme_stylesheet_path_for(params[:theme], params[:asset]), 'text/css'
    end
    def javascripts
      render_asset theme_javascript_path_for(params[:theme], params[:asset]), 'text/javascript'
    end
    def images
      render_asset theme_image_path_for(params[:theme], params[:asset], params[:extension]), "image/#{params[:extension]}"
    end
  private
    def render_asset(asset, mime_type)
      unless File.exists?(asset)
        render :text => 'not found', :status => 404
      else
        send_file asset, :type => mime_type
      end
    end
    # Physical paths
    def theme_stylesheet_path_for(name, asset)
      File.join(theme_path_for(name), 'stylesheets', "#{asset}.css")
    end
    def theme_javascript_path_for(name, asset)
      File.join(theme_path_for(name), 'javascripts', "#{asset}.js")
    end
    def theme_image_path_for(name, asset, extension = nil)
      extension ||= "png"
      extension = ".#{extension}"
      File.join(theme_path_for(name), 'images', "#{asset}#{extension}")
    end
  end
end