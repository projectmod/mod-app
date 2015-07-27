class UserSessionsController < ApplicationController
	skip_before_action :require_login, [except: :destroy]

	def new
		@user = User.new
		if params[:outlet]
			session[:prebk_outlet] = params[:outlet]
		end
	end

	def create
		if @user = login(params[:user_sessions][:email], params[:user_sessions][:password])
			if session[:prebk_outlet]
				outlet = Outlet.find(session[:prebk_outlet])
				session[:prebk_outlet] = nil
				redirect_to(outlet_path(outlet), notice: "Login Successful")
			else
				redirect_back_or_to(root_path, notice: "Login successful.")
			end
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
