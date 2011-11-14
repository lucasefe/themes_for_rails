require "spec_helper"

class MyController < ActionController::Base
  theme 'default'
  def hello
    render :text => "Just a test"
  end
  
  def theme_selector
    'custom'
  end
  
  private
  
  def private_theme_selector
    'private_custom'
  end
end

describe MyController do
  before(:each) do
    ActionController::Base.send(:include, ThemesForRails::ControllerMethods)
  end

  context "at class level" do
    it "should respond_to theme" do
      MyController.should respond_to(:theme)
    end
  end
  context "setting the theme with a String" do
    it "should set the selected theme for all actions" do
      get :hello
    end
  end
end

describe MyController do
  context "at class level" do
    it "should respond_to theme" do
      ApplicationController.should respond_to(:theme)
    end

    context "setting the theme with a String" do

      it "should set the selected theme for all actions" do
        @controller.theme 'default'
        get :hello
        @controller.theme_name.should == "default"
      end
    end

    context "setting the theme with a Symbol" do

      it "should call the selected private method" do
        @controller.theme :theme_selector
        get :hello
        @controller.theme_name.should == 'custom'
      end
    end

    context "setting the theme with a Symbol (private)" do

      it "should call the selected private method" do
        @controller.theme :private_theme_selector
        get :hello
        @controller.theme_name.should == 'private_custom'
      end
    end
  end

  context "at instance level" do

    it "should respond_to theme" do
      @controller.should respond_to(:theme)
    end

    it "should store the theme's name" do
      @controller.theme 'default'
      @controller.theme_name.should == 'default'
    end

    context "when a theme has been set" do

      it "should add the theme's view path to the front of the general view paths" do
        antes = @controller.view_paths.map(&:original_path_set).flatten
        @controller.theme 'default'  
        @controller.view_paths.size.should == antes.size + 1
      end

      it "should have a proper view path" do
        @controller.theme 'default'
        view_path = @controller.view_paths.map(&:original_path_set).flatten.first
        theme_path = Pathname.new(File.join(File.expand_path(File.dirname(__FILE__)), "../", "dummy", "app", "themes", "default", "views")).realpath.to_s
        theme_path.should == view_path.to_s
      end
    end
  end
end

