module ThemesForRails
  module Routes
    def themes_for_rails
      match 'themes/:theme/stylesheets/*asset' => 'themes_for_rails/assets#stylesheets', :as => :base_theme_stylesheet
      match 'themes/:theme/javascripts/*asset' => 'themes_for_rails/assets#javascripts', :as => :base_theme_javascript
      match 'themes/:theme/images/*asset' => 'themes_for_rails/assets#images', :as => :base_theme_image
    end
  end
end
module ActionDispatch::Routing
  class Mapper #:nodoc:
    include ThemesForRails::Routes
  end
end

