require "test_helper"

# assert_generates
# assert_recognizes
# assert_routing

module ThemeSupport
  class RoutingTest < ActionController::TestCase  
    test "recognize stylesheets route" do
      assert_generates('/themes/default/stylesheets/app.css', { 
        :controller => 'theme_support/assets', 
        :action => 'stylesheets',
        :theme => 'default', 
        :asset => 'app',
        :format => 'css'
      })
    end
    test "recognize javascripts route" do
      assert_generates('/themes/default/javascripts/app.js', { 
        :controller => 'theme_support/assets', 
        :action => 'javascripts',
        :theme => 'default', 
        :asset => 'app',
        :format => 'js'
      })
    end
    test "recognize images route" do
      assert_generates('/themes/default/images/logo.png', { 
        :controller => 'theme_support/assets', 
        :action => 'images',
        :theme => 'default', 
        :asset => 'logo',
        :format => 'png'
      })
    end
  end
  
end
