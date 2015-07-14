class UsersController < ApplicationController

	skip_before_action :require_login, only: [:index, :new, :create, :activate]

	def new
		@user = User.new
	end

	def index
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.activation_needed_email(@user).deliver_now
			redirect_to root_path, notice: "User was successfully created."
		else
			redirect_to root_path
			flash[:notice] = "Sign up unsuccessful, please try again."
		end
	end

	def update
		user = User.find(params[:id])

		if user.update(user_params)
			redirect_to dashboard_account_path
		end
	end

	def destroy
	end

	def activate
		if (@user = User.load_from_activation_token(params[:id]))
			@user.activate!
			redirect_to(login_path, notice: 'User was successfully activated.')
		else
			not_authenticated
		end
	end

	private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def not_authenticated
  	redirect_to login_path, alert: "Please login first."
  end

end
