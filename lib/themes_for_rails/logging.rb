module ThemesForRails
  module Logging

    def log(message, options = {})
      message = "#{options.fetch(:prefix, logger_prefix)} #{message}"
      Rails.logger.send(options.fetch(:level, :debug), message)
    end

    def logger_prefix
      "[TFR]"
    end

  end
end
