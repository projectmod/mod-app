class AdminSessionsController < ApplicationController
    
	def new
	end

	def create
		if @user = login(params[:user_sessions][:email], params[:user_sessions][:password])
			flash[:notice] = "You've succesfully logged in!"
			redirect_to rails_admin_path
		else
			flash[:error] = 'We failed to log you in. Please try again!'
			render action: 'new'
		end
	end
end
