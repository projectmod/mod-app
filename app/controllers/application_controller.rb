class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :require_login

  def not_authenticated
  # Make sure that we reference the route from the main app.
    redirect_to '/login'
  end
end
