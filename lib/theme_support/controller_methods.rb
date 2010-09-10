module ThemeSupport
  module ControllerMethods
    extend ActiveSupport::Concern
    included do
      attr_accessor :theme_name
    end
    module InstanceMethods
      def theme(theme_name)
        @theme_name = theme_name
        set_theme(theme_name)
      end
    private
      def set_theme(theme_name)
        add_theme_view_path_for(theme_name)
      end
      def add_theme_view_path_for(theme_name)
        self.view_paths << ActionView::FileSystemResolver.new(theme_path_for(theme_name))
      end
      def theme_path_for(theme_name)
        File.join(::Rails.root, "themes", @theme_name.to_s, "views")
      end
    end
  end
end

ActiveSupport.on_load(:action_controller) { include ThemeSupport::ControllerMethods }