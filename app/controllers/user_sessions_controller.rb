class UserSessionsController < ApplicationController
	before_action :require_login, only: :destroy
	
	def new
		@user = User.new

		session[:prebk_outlet] = params[:outlet] if params[:outlet]
	end

	def create
		if @user = login(params[:user_sessions][:email], params[:user_sessions][:password])
			flash[:notice] = "You've succesfully logged in!"
			outlet = Outlet.find_by(id: session[:prebk_outlet])
			session[:prebk_outlet] = nil

			return redirect_to outlet_path(outlet) if outlet

			redirect_back_or_to root_path
		else

			flash[:error] = 'We failed to log you in. Please try again!'
			render action: 'new'
		end
	end

	def destroy
		logout
		flash[:notice] = "You've logged out, see you again!"
		redirect_to root_path
	end
end
