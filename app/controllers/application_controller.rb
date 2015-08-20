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
    return redirect_to new_merchants_session_path if self.class.parent == Merchants
    redirect_to login_path
  end
end
