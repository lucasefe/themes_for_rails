require "spec_helper"

describe "ThemesForRails::CommonMethods" do
  before :all do
    @common = Object.new
    @common.extend ThemesForRails::CommonMethods
    @common.theme_name = "awesome"
    ThemesForRails.config.clear
  end

  it 'should use config base_dir to build theme path' do
    ThemesForRails.config.base_dir ='some_path'
    @common.theme_path.should match(/some_path/)
  end

  it 'should use config themes_dir to build theme path' do
    ThemesForRails.config.themes_dir ='skinner'
    @common.theme_path.should match(/skinner/)
  end
  
  it 'should use config base_dir to build theme path for theme' do
    ThemesForRails.config.base_dir ='some_path'
    @common.theme_path_for('doodley').should match(/some_path/)
  end
end