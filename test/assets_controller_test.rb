require "test_helper"

module ThemeSupport
  class AssetsControllerTest < ActionController::TestCase  
    tests ApplicationController
    should "respond_to theme" do
      assert @controller.respond_to?(:theme)
    end
    should "should store the theme's name" do
      @controller.theme :default
      assert_equal @controller.theme_name, :default
    end
  end
end