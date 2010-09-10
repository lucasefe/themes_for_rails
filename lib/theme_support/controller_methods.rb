module ThemeSupport
  module ControllerMethods
    extend ActiveSupport::Concern
    included do
      attr_accessor :theme_name
    end
    module ClassMethods
      def theme(theme_name)
        puts "setting theme #{theme_name}!"
      end
    end
    module InstanceMethods
      def theme(theme_name)
        @theme_name = theme_name
      end
    end
  end
end

ActiveSupport.on_load(:action_controller) { include ThemeSupport::ControllerMethods }