require 'spec_helper'

describe ThemesForRails::ViewHelpers do

  let(:helper) do 
    Class.new do
      attr_accessor :theme_name
      include ThemesForRails::ViewHelpers
      include Sprockets::Helpers::RailsHelper
    end.new
  end

  it "should provide path helpers for common asset formats" do
    helper.theme_image_path('logo.png', 'pink').should == "/themes/pink/assets/logo.png"
    helper.theme_stylesheet_path('app.css', 'pink').should == "/themes/pink/assets/app.css"
    helper.theme_javascript_path('app.js', 'pink').should == "/themes/pink/assets/app.js"
  end
  
  it "should provide path helpers for current assets" do
    helper.theme_name = "pink" 
    helper.current_theme_image_path('logo.png').should == "/themes/pink/assets/logo.png"
    helper.current_theme_stylesheet_path('app.css').should == "/themes/pink/assets/app.css"
    helper.current_theme_javascript_path('app.js').should == "/themes/pink/assets/app.js"
  end
  
  it "should delegate options when provided" do
    helper.theme_name = "pink" 
    helper.stub(:params=> {})
    helper.theme_javascript_include_tag('app.js', :title => "ponele").should match(/title=\"ponele\"/)
    helper.theme_stylesheet_link_tag('app.css', :media => "screen").should match(/media=\"screen\"/)
  end
end
