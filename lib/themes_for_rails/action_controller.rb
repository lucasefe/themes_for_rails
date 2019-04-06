# encoding: utf-8
module ThemesForRails

  module ActionController

    extend ActiveSupport::Concern

    included do

      include ThemesForRails::CommonMethods
      include ThemesForRails::UrlHelpers

    end

    module ClassMethods

      def theme(name, options = {})
        before_action(options) do |controller|
          controller.set_theme(name)
        end
      end

    end

    def theme(name)
      set_theme(name)
    end

  end

end

