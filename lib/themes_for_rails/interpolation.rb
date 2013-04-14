module ThemesForRails

  module Interpolation
    
    def interpolate(pattern, name = nil)
      ThemesForRails::Interpolation.interpolate(pattern, name)
    end
    
    def self.interpolate(pattern, name = nil)
      pattern.gsub(":root", ThemesForRails.config.base_dir).gsub(":name", name.to_s)
    end

  end
  
end