class ApplicationController < ActionController::Base

  protect_from_forgery

  theme :current_theme

  def current_theme
    'default'
  end

end
