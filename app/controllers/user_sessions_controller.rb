class UserSessionsController < ApplicationController
	skip_before_action :require_login, [except: :destroy]

	def new
		@user = User.new
	end

	def create
		if @user = login(params[:user_sessions][:email], params[:user_sessions][:password])
			redirect_back_or_to(root_path, notice: 'Login successful.')
		else
			flash[:notice] = 'Login failed.'
			render action: 'new'
		end
	end

	def destroy
		logout
		redirect_to root_path
		flash[:notice] = "Logged out."
	end

end
