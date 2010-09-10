require "test_helper"

module ThemeSupport
  class AssetsControllerTest < ActionController::TestCase  
    tests ApplicationController
    
    should "respond_to theme" do
      assert @controller.respond_to?(:theme)
    end
    
  end
end