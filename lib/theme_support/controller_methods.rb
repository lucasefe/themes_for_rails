module ThemeSupport
  module ControllerMethods
    extend ActiveSupport::Concern
    included do
      attr_accessor :theme_name
      include ThemeSupport::CommonMethods
      include ThemeSupport::UrlHelpers
    end
    module ClassMethods
      def theme(name, options = {})
        before_filter(options) do |controller|
          controller.set_theme(name)
        end
      end
    end
    module InstanceMethods
      def theme(name)
        set_theme(name)
      end
    end
  end
end

ActiveSupport.on_load(:action_controller) { include ThemeSupport::ControllerMethods }