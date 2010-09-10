require "test_helper"

module ThemeSupport
  class RoutingTest < ActionController::TestCase  
    should "recognize stylesheets route" do
      assert_generates('/themes/default/stylesheets/app.css', { 
        :controller => 'theme_support/assets', 
        :action => 'stylesheets',
        :theme => 'default', 
        :asset => 'app',
        :extension => 'css'
      })
    end
    should "recognize javascripts route" do
      assert_generates('/themes/default/javascripts/app.js', { 
        :controller => 'theme_support/assets', 
        :action => 'javascripts',
        :theme => 'default', 
        :asset => 'app',
        :extension => 'js'
      })
    end
    should "recognize images route" do
      assert_generates('/themes/default/images/logo.png', { 
        :controller => 'theme_support/assets', 
        :action => 'images',
        :theme => 'default', 
        :asset => 'logo',
        :extension => 'png'
      })
    end
  end
end
