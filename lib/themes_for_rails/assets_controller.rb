require "action_controller/metal"

module ThemesForRails
  class AssetsController < ActionController::Base
    
    include ThemesForRails::CommonMethods
    include ThemesForRails::UrlHelpers
    
    def stylesheets
      filename, extension = extract_filename_and_extension_from(params[:asset])
      render_asset theme_stylesheet_path_for(params[:theme], filename), 'text/css'
    end
    
    def javascripts
      filename, extension = extract_filename_and_extension_from(params[:asset])
      render_asset theme_javascript_path_for(params[:theme], filename), 'text/javascript'
    end
    
    def images
      filename, extension = extract_filename_and_extension_from(params[:asset])
      render_asset theme_image_path_for(params[:theme], filename, extension), "image/#{extension.gsub('.', '')}"
    end
    
  private
  
    def extract_filename_and_extension_from(asset)
      extension = File.extname(asset)
      filename = params[:asset].gsub(extension, '')
      return filename, extension
    end
    
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