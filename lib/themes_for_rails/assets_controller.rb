require "action_controller/metal"

module ThemesForRails
  class AssetsController < ActionController::Base
    include ThemesForRails::CommonMethods
    include ThemesForRails::UrlHelpers
    def stylesheets
      filename = File.basename(params[:asset], File.extname(params[:asset]))
      render_asset theme_stylesheet_path_for(params[:theme], filename), 'text/css'
    end
    def javascripts
      filename = File.basename(params[:asset], File.extname(params[:asset]))
      render_asset theme_javascript_path_for(params[:theme], filename), 'text/javascript'
    end
    def images
      extension = File.extname(params[:asset])
      filename = params[:asset].gsub(extension, '')
      render_asset theme_image_path_for(params[:theme], filename, extension), "image/#{extension.gsub('.', '')}"
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
    def theme_image_path_for(name, asset, extension = ".png")
      File.join(theme_path_for(name), 'images', "#{asset}#{extension}")
    end
  end
end