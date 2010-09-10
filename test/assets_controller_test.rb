require "test_helper"

module ThemeSupport
  class AssetsControllerTest < ActionController::TestCase  
    context "as an instance" do
      tests ApplicationController
      should "respond_to theme" do
        assert @controller.respond_to?(:theme)
      end
      should "should store the theme's name" do
        @controller.theme :default
        assert_equal @controller.theme_name, :default
      end
      context "when a theme has been set" do
        tests ApplicationController
        should "add the theme's view path to the list of general view paths" do
          antes = @controller.view_paths.size
          @controller.theme :default  
          assert_equal antes + 1, @controller.view_paths.size
        end
        should "have a proper view path" do
          @controller.theme :default
          view_path = @controller.view_paths.last
          theme_path = File.join(File.expand_path(File.dirname(__FILE__)), "dummy_app", "themes", "default", "views")
          assert_equal view_path.to_s, theme_path
        end
      end
    end
  end
end