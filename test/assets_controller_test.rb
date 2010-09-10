require "test_helper"

module ThemeSupport
  class AssetsControllerTest < ActionController::TestCase  
    tests ThemeSupport::AssetsController
    should "respond to stylesheets" do
      assert @controller.respond_to?(:stylesheets)
    end
    should "respond to javascripts" do
      assert @controller.respond_to?(:javascripts)
    end
    should "respond to images" do
      assert @controller.respond_to?(:images)
    end
  end
end