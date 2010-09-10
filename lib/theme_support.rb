require 'active_support/dependencies'
module ThemeSupport
  autoload :Routes, 'theme_support/routes'
  autoload :AssetsController, 'theme_support/assets_controller'
  autoload :ControllerMethods, 'theme_support/controller_methods'
end
require 'theme_support/railtie'
require 'theme_support/routes'
require 'theme_support/version'
