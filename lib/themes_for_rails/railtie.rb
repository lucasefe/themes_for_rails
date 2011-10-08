module ThemesForRails
  class Railtie < ::Rails::Railtie
    config.themes_for_rails = ActiveSupport::OrderedOptions.new

    config.to_prepare do
      ThemesForRails::Railtie.config.themes_for_rails.each do |key, value|
        ThemesForRails.config.send "#{key}=".to_sym, value
      end
    end
  end
end