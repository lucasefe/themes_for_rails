require "test_helper"

module ThemesForRails
  class RoutingTest < ActionController::TestCase  
    should "recognize stylesheets route" do
      assert_generates('/themes/default/stylesheets/app.css', { 
        :controller => 'themes_for_rails/assets', 
        :action => 'stylesheets',
        :theme => 'default', 
        :asset => 'app',
        :extension => 'css'
      })
    end
    should "recognize javascripts route" do
      assert_generates('/themes/default/javascripts/app.js', { 
        :controller => 'themes_for_rails/assets', 
        :action => 'javascripts',
        :theme => 'default', 
        :asset => 'app',
        :extension => 'js'
      })
    end
    should "recognize images route" do
      assert_generates('/themes/default/images/logo.png', { 
        :controller => 'themes_for_rails/assets', 
        :action => 'images',
        :theme => 'default', 
        :asset => 'logo',
        :extension => 'png'
      })
    end
  end
end
