require "action_controller/metal"

module ThemesForRails
  class AssetsController < ActionController::Base
    
    include ThemesForRails::CommonMethods
    include ThemesForRails::UrlHelpers
    
    def stylesheets
      render_asset asset_path_for(params[:asset], 'stylesheets'), mime_type_from(params[:asset])
    end
    
    def javascripts
      render_asset asset_path_for(params[:asset], 'javascripts'), mime_type_from(params[:asset])  
    end
    
    def images
      render_asset asset_path_for(params[:asset], 'images'), mime_type_from(params[:asset])  
    end
    
  private
  
    def asset_path_for(asset_url, asset_prefix)
      File.join(theme_path_for(params[:theme]), asset_prefix, params[:asset])
    end
    
    def extract_filename_and_extension_from(asset)
      extension = File.extname(asset)
      filename = params[:asset].gsub(extension, '')
      return filename, extension[1..-1]
    end
    
    def render_asset(asset, mime_type)
      unless File.exists?(asset)
        render :text => 'not found', :status => 404
      else
        send_file asset, :type => mime_type
      end
    end
  
    def mime_type_from(asset_path)
      extension = extract_filename_and_extension_from(asset_path).last
      if extension == 'css'
        "text/css"
      elsif extension == 'js'
        'text/javascript'
      else
        "image/#{extension}"
      end
    end
  end
end