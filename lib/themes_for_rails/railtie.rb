# ActiveSupport.on_load(:action_view) { include Devise::Controllers::UrlHelpers }

module ThemesForRails
  class Railtie < ::Rails::Railtie
    config.themes_for_rails = ActiveSupport::OrderedOptions.new
    config.themes_for_rails.on = true
    # config.themes_for_rails.base_path = File.join([::Rails.root, 'themes'])
    rake_tasks do
      load "tasks/themes_for_rails.rake"
    end

    config.to_prepare do
      ThemesForRails::Railtie.config.themes_for_rails.each do |k, v|
        Rails.logger.info "themes_for_rails.#{k}: #{v}"
      end
    end
  end
end