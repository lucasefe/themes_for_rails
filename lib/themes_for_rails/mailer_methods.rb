module ThemesForRails
  module MailerMethods
    extend ActiveSupport::Concern

    included do
      alias_method_chain :mail, :theme
    end

    module InstanceMethods

      def mail_with_theme(headers = {}, &block)
        theme(self.class.default[:theme]) if self.class.default[:theme]

        mail_without_theme(headers, &block)
      end
    end
  end
end

ActiveSupport.on_load(:action_mailer) { include ThemesForRails::MailerMethods }
