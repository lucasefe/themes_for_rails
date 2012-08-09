# encoding: utf-8
module ThemesForRails
  class Railtie < ::Rails::Railtie

    config.themes_for_rails = ActiveSupport::OrderedOptions.new

    config.to_prepare do
      ThemesForRails::Railtie.config.themes_for_rails.each do |key, value|
        ThemesForRails.config.send "#{key}=".to_sym, value
      end
      
      # Adding theme stylesheets path to sass, automatically.
      ThemesForRails.add_themes_path_to_sass if ThemesForRails.config.use_sass?

      # Check if asset pipeline enabled
      ThemesForRails.check_asset_pipeline

      # Adding theme assets to the asset pipeline, automatically.
      ThemesForRails.add_themes_assets_to_asset_pipeline if ThemesForRails.config.asset_digests_enabled?

      ActiveSupport.on_load(:action_view) do
        include ThemesForRails::ActionView
      end

      ActiveSupport.on_load(:action_controller) do
        include ThemesForRails::ActionController
      end

      ActiveSupport.on_load(:action_mailer) do
        include ThemesForRails::ActionMailer
      end
    end
    
    rake_tasks do
      load "tasks/themes_for_rails.rake"
    end
  end
end