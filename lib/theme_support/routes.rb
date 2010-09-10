module ThemeSupport
  module Routes
    def theme_support
      match 'themes/:theme/stylesheets/:asset(.:extension)' => 'theme_support/assets#stylesheets', :as => :base_theme_stylesheet
      match 'themes/:theme/javascripts/:asset(.:extension)' => 'theme_support/assets#javascripts', :as => :base_theme_javascript
      match 'themes/:theme/images/:asset(.:extension)' => 'theme_support/assets#images', :as => :base_theme_image
    end
  end
end
module ActionDispatch::Routing
  class Mapper #:nodoc:
    include ThemeSupport::Routes
  end
end

