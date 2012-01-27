module ThemesForRails
  module MailerMethods
    extend ActiveSupport::Concern

    included do
      alias_method_chain :mail, :theme
    end

    def mail_with_theme(headers = {}, &block)
      theme_opts = headers[:theme] || self.class.default[:theme]
      theme(theme_opts) if theme_opts

      mail_without_theme(headers, &block)
    end
  end
end

ActiveSupport.on_load(:action_mailer) { include ThemesForRails::MailerMethods }
