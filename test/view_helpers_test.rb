require "test_helper"

module ThemesForRails
  class ViewHelpersTest < ActionController::IntegrationTest
    include ThemesForRails::ViewHelpers

    include ActionView::Helpers::AssetTagHelper
    include ERB::Util
    include ActionView::Helpers::TagHelper

    def theme_name
      'default'
    end

    def config
      @config ||= stub({:perform_caching => false, :asset_path => "/assets", :asset_host => ''})
    end

    should 'delegate to stylesheet_link_tag' do
      assert theme_stylesheet_link_tag('cuac.css').include?('media="screen"')
    end

    should 'delegate options (lazy testing, I know)' do
      assert theme_stylesheet_link_tag('cuac.css', :media => 'print').include?('media="print"')
    end
    should 'delegate options in image_tag' do
      assert_match /width=.40/, theme_image_tag('image.css', :size => '40x50')
    end
  end
end