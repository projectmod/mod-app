class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError do |exception|
    flash[:alert] = exception.message
  	redirect_to root_path
  end

  def not_authenticated
    flash[:alert] = "Please login first"
    redirect_to login_path
  end
end
