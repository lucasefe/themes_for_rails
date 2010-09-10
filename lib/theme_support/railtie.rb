# ActiveSupport.on_load(:action_view) { include Devise::Controllers::UrlHelpers }

module ThemeSupport
  class Railtie < ::Rails::Railtie
    config.theme_support = ActiveSupport::OrderedOptions.new
    config.theme_support.on = true
    # config.theme_support.base_path = File.join([::Rails.root, 'themes'])
    rake_tasks do
      load "tasks/theme_support.rake"
    end

    config.to_prepare do
      ThemeSupport::Railtie.config.theme_support.each do |k, v|
        Rails.logger.info "theme_support.#{k}: #{v}"
      end
    end
  end
end