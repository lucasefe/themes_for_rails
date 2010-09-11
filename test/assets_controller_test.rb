require "test_helper"

module ThemesForRails
  class AssetsControllerTest < ActionController::TestCase  
    tests ThemesForRails::AssetsController
    should "respond to stylesheets" do
      assert @controller.respond_to?(:stylesheets)
    end
    should "respond with the right stylesheet file when requested" do
      get 'stylesheets', { :theme => 'default', :asset => 'style', :extension => 'css'}
      assert_response :success
      assert_template "themes/default/stylesheets/style.css"
    end
    should "not be success when the stylesheet file is not found" do
      get 'stylesheets', { :theme => 'default', :asset => 'oldstyle', :extension => 'css'}
      assert_response :missing
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
    should "not be success when the javascript file is not found" do
      get 'javascripts', { :theme => 'default', :asset => 'oldapp', :extension => 'js'}
      assert_response :missing
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
    should "not be success when the image file is not found" do
      get 'images', { :theme => 'default', :asset => 'logo', :extension => 'jpg'}
      assert_response :missing
    end
  end
end