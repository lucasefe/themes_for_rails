module ThemeSupport
  module ControllerMethods
    extend ActiveSupport::Concern
    included do
      attr_accessor :theme_name
      include ThemeSupport::HelperMethods
    end
    module InstanceMethods
      def theme(theme_name)
        @theme_name = theme_name
        set_theme(theme_name)
      end
    private

    end
  end
end

ActiveSupport.on_load(:action_controller) { include ThemeSupport::ControllerMethods }