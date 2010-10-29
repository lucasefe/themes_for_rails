module ThemesForRails
  class Config
    class << self
    
      def initialize(&block)
        yield
      end
      
      private

      def self.theme_path(path)
        ThemesForRails.available_themes(path)
      end
    
    end
  end  
end