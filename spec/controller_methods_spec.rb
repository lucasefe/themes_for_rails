require "spec_helper"
require 'ruby-debug'

class MyController < ActionController::Base
  def hello
    render :text => "Just a test"
  end
end

class CustomThemeController < ActionController::Base
  def hello
    render :text => "Just a test"
  end
  
  def theme_selector
    'custom'
  end
end

class PrivateCustomThemeController < ActionController::Base
  def hello
    render :text => "Just a test"
  end

  private
  
  def private_theme_selector
    'private_custom'
  end
end

describe "ActionMailerInclusion" do
  it "should include the ControllerMethods module" do
    ActionMailer::Base.included_modules.should include(ThemesForRails::ControllerMethods)
  end
end

describe "ActionControllerInclusion" do
  it "should include the ControllerMethods module" do
    ActionController::Base.included_modules.should include(ThemesForRails::ControllerMethods)
  end
end

describe "ApplicationControllerInclusion" do
  it "should include the ControllerMethods module" do
    ApplicationController.included_modules.should include(ThemesForRails::ControllerMethods)
  end
end

describe ThemesForRails::ControllerMethods do
  before(:each) do
    ActionController::Base.send(:include, ThemesForRails::ControllerMethods)
    @controller_class = MyController
    @controller = MyController.new
    #@controller_class.send(:include, ThemesForRails::ControllerMethods)
  end

  context "at class level" do
    it "should respond_to theme" do
      @controller_class.should respond_to(:theme)
    end

    context "setting the theme with a String" do
      #tests MyController

      #describe MyController do
        #let(:controller) { MyController.new }  

        it "should set the selected theme for all actions" do
          #@controller_class.theme 'default'
          @controller_class.send(:theme, 'default')
          #@controller.should_receive(:set_theme).with('default')
          #debugger
          @controller.theme_name.should == 'default'

          #get :hello
        end

        #pending "have troubles"
      #end
    end
  end
end

=begin

#controller_name :events
describe "ThemesForRails::ControllerMethods" do
  context "at class level" do
    it "should respond_to theme" do
      ApplicationController.should respond_to(:theme)
    end

    context "setting the theme with a String" do
      #tests MyController

      it "should set the selected theme for all actions" do
        MyController.theme 'default'
        @controller.should_receive(:set_theme).with('default')
        @controller.theme_name.should be_nil
        get :hello
      end        
    end

    context "setting the theme with a Symbol" do
      #tests CustomThemeController

      it "should call the selected private method" do
        CustomThemeController.theme :theme_selector
        get :hello
        @controller.theme_name.should == 'custom'
      end
    end

    context "setting the theme with a Symbol (private)" do
      #tests PrivateCustomThemeController

      it "should call the selected private method" do
        PrivateCustomThemeController.theme :private_theme_selector
        get :hello
        @controller.theme_name.should == 'private_custom'
      end
    end
  end

  context "at instance level" do
    #tests ApplicationController

    it "should respond_to theme" do
      @controller.should respond_to(:theme)
    end

    should "should should store the theme's name" do
      @controller.theme 'default'
      @controller.theme_name.should == 'default'
    end

    context "when a theme has been set" do
      #tests ApplicationController

      it "should add the theme's view path to the front of the general view paths" do
        antes = @controller.view_paths.size
        @controller.theme 'default'  
        @controller.view_paths.should == antes + 1
      end

      it "should have a proper view path" do
        @controller.theme 'default'
        view_path = @controller.view_paths.first
        theme_path = File.join(File.expand_path(File.dirname(__FILE__)), "dummy", "app" "themes", "default", "views")
        theme_path.should == view_path.to_s
      end
    end
  end
end
=end
