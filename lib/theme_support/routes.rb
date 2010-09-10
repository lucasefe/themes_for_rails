module ThemeSupport
  module Routes
    def theme_support
      match 'themes/:theme/stylesheets/:asset(.:extension)' => 'theme_support/assets#stylesheets'
      match 'themes/:theme/javascripts/:asset(.:extension)' => 'theme_support/assets#javascripts'
      match 'themes/:theme/images/:asset(.:extension)' => 'theme_support/assets#images'
    end
  end
end
module ActionDispatch::Routing
  class Mapper #:nodoc:
    include ThemeSupport::Routes
  end
end

