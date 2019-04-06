# encoding: utf-8
module ThemesForRails
  module ThemedMail
    def mail(headers = {}, &block)
      theme_opts = headers[:theme] || self.class.default[:theme]
      theme(theme_opts) if theme_opts
      super
    end
  end

  module ActionMailer
    extend ActiveSupport::Concern
    included do
      include ThemesForRails::ActionController
      prepend ThemesForRails::ThemedMail
    end
  end
end
