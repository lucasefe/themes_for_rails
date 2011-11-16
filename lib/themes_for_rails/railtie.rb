module ThemesForRails
  class Railtie < ::Rails::Railtie

    config.themes_for_rails = ActiveSupport::OrderedOptions.new
    #
    #initializer 'themes_for_rails.initialize', :before=> 'sprockets.environment' do
    #
    #  raise "Sprockets not enabled" unless Rails.application.config.assets.enabled
    #
    #  Sprockets::Environment.send :include, ThemesForRails::AssetsFinder
    #
    #end

    config.to_prepare do
      ThemesForRails::Railtie.config.themes_for_rails.each do |key, value|
        ThemesForRails.config.send "#{key}=".to_sym, value
      end
    end

  end
end
