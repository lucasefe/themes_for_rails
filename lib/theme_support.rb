require 'active_support/dependencies'
module ThemeSupport
  autoload :Routes, 'theme_support/routes'
  autoload :AssetsController, 'theme_support/assets_controller'
  autoload :Routes, 'theme_support/routes'
end

require 'theme_support/version'
require 'theme_support/railtie'