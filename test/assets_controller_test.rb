require "test_helper"

module ThemeSupport
  class AssetsControllerTest < ActionController::TestCase  
    tests ThemeSupport::AssetsController
    should "respond to stylesheets" do
      assert @controller.respond_to?(:stylesheets)
    end
    should "respond with the right stylesheet file when requested" do
      get 'stylesheets', { :theme => 'default', :asset => 'style', :extension => 'css'}
      assert_response :success
      assert_template "themes/default/stylesheets/style.css"
    end
    # javascripts
    should "respond to javascripts" do
      assert @controller.respond_to?(:javascripts)
    end
    should "respond with the right javascript file when requested" do
      get 'javascripts', { :theme => 'default', :asset => 'app', :extension => 'js'}
      assert_response :success
      assert_template "themes/default/javascripts/app.js"
    end
    # images
    should "respond to images" do
      assert @controller.respond_to?(:images)
    end
    should "respond with the right image file when requested" do
      get 'images', { :theme => 'default', :asset => 'logo', :extension => 'png'}
      assert_response :success
      assert_template "themes/default/images/logo.png"
    end
  end
end