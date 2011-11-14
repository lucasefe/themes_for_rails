require "spec_helper"

describe "ThemesForRails::Config" do
  before :each do
    ThemesForRails.config.clear
  end

  it 'should change the directory to directory with themes that we specify' do
    ThemesForRails.config do |config|
      config.themes_dir = 'app/themes'
    end

    ThemesForRails.available_theme_names.should == ['default']
  end

  it 'should change the directory to default themes directory' do
  	ThemesForRails.available_theme_names.should == ['default']
  end
end