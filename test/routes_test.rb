require "test_helper"

module ThemesForRails
  class RoutingTest < ActionController::TestCase  
    should "recognize stylesheets route" do
      assert_generates('/themes/default/stylesheets/app.css', { 
        :controller => 'themes_for_rails/assets', 
        :action => 'stylesheets',
        :theme => 'default', 
        :asset => 'app.css'
      })
    end
    should "recognize javascripts route" do
      assert_generates('/themes/default/javascripts/app.js', { 
        :controller => 'themes_for_rails/assets', 
        :action => 'javascripts',
        :theme => 'default', 
        :asset => 'app.js'
      })
    end
    should "recognize images route" do
      assert_generates('/themes/default/images/logo.png', { 
        :controller => 'themes_for_rails/assets', 
        :action => 'images',
        :theme => 'default', 
        :asset => 'logo.png'
      })
    end
    
    should "recognize nested route" do
      assert_generates('/themes/default/images/nested/logo.png', { 
        :controller => 'themes_for_rails/assets', 
        :action => 'images',
        :theme => 'default', 
        :asset => 'nested/logo.png'
      })
    end
  end
end
