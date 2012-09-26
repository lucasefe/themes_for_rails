module ThemesForRails

  module Interpolation

    def interpolate(pattern, name = nil)
      pattern.gsub(":root", ThemesForRails.config.base_dir.to_s).gsub(":name", name.to_s)
    end

  end
  
end