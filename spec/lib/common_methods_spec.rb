require "spec_helper"

describe "ThemesForRails::CommonMethods" do
  before :all do
    @common = Object.new
    @common.extend ThemesForRails::CommonMethods
    @common.theme_name = "awesome"
    ThemesForRails.config.clear
  end

  it 'should use config themes_dir to build theme views path' do
    ThemesForRails.config.themes_dir = 'skinner'
    @common.send(:views_path_for, 'skinner').should match(/skinner\/views/)
  end

  it 'should use config themes_dir to build theme javascripts assets path' do
    ThemesForRails.config.themes_dir = 'skinner'
    @common.send(:assets_path_for, 'skinner', :javascripts).should match(/skinner\/assets\/javascripts/)
  end

  it 'should use config themes_dir to build theme stylesheets assets path' do
    ThemesForRails.config.themes_dir = 'skinner'
    @common.send(:assets_path_for, 'skinner', :stylesheets).should match(/skinner\/assets\/stylesheets/)
  end
  
  it 'should use config themes_dir to build theme images assets path' do
    ThemesForRails.config.themes_dir = 'skinner'
    @common.send(:assets_path_for, 'skinner', :images).should match(/skinner\/assets\/images/)
  end
end