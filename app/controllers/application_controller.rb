class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError do |exception|
    flash[:notice] = "You're not authorized to access this page."
  	redirect_to root_path
  end

  def not_authenticated
    flash[:notice] = "Please login first."

    return redirect_to main_app.admin_portal_path if request.script_name == "/superadmin"
    redirect_to root_path
  end
end
