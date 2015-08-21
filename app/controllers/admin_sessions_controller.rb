class AdminSessionsController < ApplicationController
	before_action :redirect_if_logged_in

	def new
	end

	def create
		user = login(params[:user_sessions][:email], params[:user_sessions][:password])

    if user && user.admin?
			flash[:notice] = "You've succesfully logged in!"
			redirect_to rails_admin_path
		else
			flash[:notice] = 'We failed to log you in. Please try again!'
			render action: 'new'
		end
	end

	private

	def redirect_if_logged_in
		return redirect_back_or_to root_path if current_user
	end
end
