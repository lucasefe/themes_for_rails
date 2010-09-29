require "test_helper"

class MyController < ActionController::Base
  def hello
    render :text => "Just a test"
  end
end
class CustomThemeController < ActionController::Base
  def hello
    render :text => "Just a test"
  end
end
module ThemesForRails
  class ControllerMethodsTest < ActionController::TestCase  
    context "at class level" do
      should "respond_to theme" do
        assert ApplicationController.respond_to?(:theme)
      end
      context "setting the theme with a String" do
        tests MyController
        should "set the selected theme for all actions" do
          MyController.theme 'default'
          @controller.expects(:set_theme).with('default')
          assert_equal nil, @controller.theme_name
          get :hello
        end        
      end
      context "setting the theme with a Symbol" do
        tests CustomThemeController
        should "call the selected method" do
          @controller.expects(:theme_selector).returns('custom')
          CustomThemeController.theme :theme_selector
          assert_equal nil, @controller.theme_name
          get :hello
        end
      end
    end
    context "at instance level" do
      tests ApplicationController
      should "respond_to theme" do
        assert @controller.respond_to?(:theme)
      end
      should "should store the theme's name" do
        @controller.theme 'default'
        assert_equal @controller.theme_name, 'default'
      end
      context "when a theme has been set" do
        tests ApplicationController
        should "add the theme's view path to the front of the general view paths" do
          antes = @controller.view_paths.size
          @controller.theme 'default'  
          assert_equal antes + 1, @controller.view_paths.size
        end
        should "have a proper view path" do
          @controller.theme 'default'
          view_path = @controller.view_paths.first
          theme_path = File.join(File.expand_path(File.dirname(__FILE__)), "dummy_app", "themes", "default", "views")
          assert_equal view_path.to_s, theme_path
        end
      end
    end
    context "using url helpers" do
      tests ApplicationController
      should "provide url method to access a given stylesheet file in the current theme" do
        @controller.theme 'default'
        assert_equal @controller.send(:current_theme_stylesheet_path, "style"), "/themes/default/stylesheets/style.css"
      end
      should "provide url method to access a given javascript file in the current theme" do
        @controller.theme 'default'
        assert_equal @controller.send(:current_theme_javascript_path, "app"), "/themes/default/javascripts/app.js"
      end
      should "provide url method to access a given image file in the current theme" do
        @controller.theme 'default'
        assert_equal @controller.send(:current_theme_image_path, "logo.png"), "/themes/default/images/logo.png"
      end
    end
  end
end