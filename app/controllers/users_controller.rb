class UsersController < ApplicationController
	skip_before_action :require_login, except: [:update, :destroy]
	before_action :set_user, only: [:activate, :verify, :edit]

	def new
		# Step 1
		@user = User.new
	end

	def verify
		# Step 2
	end

	def activate
		verification_code = params[:phone][:verification_code]

		activated = Users::Verify.new(verification_code, @user).check
		# code; compare it with db, if match activate user!
		if activated
			redirect_to edit_user_path(@user)
		end
	end

	def index
	end

	def edit
		# Step 3
		redirect_to verify_user_path(@user) unless @user.activated
	end

	def create
		user = Users::Check.new(params[:phone_no]).exist
		VerificationCode.new(user).deliver

		if user
			auto_login(user, should_remember=false)
			redirect_to verify_user_path(user)
		else
			redirect_to root_path
		end
	end

	def update
		update_params = user_params.delete_if { |k,v| v.empty? }

		if update_params[:password] || update_params[:password_confirmation]
			user = User.authenticate(update_params[:email], params[:user][:current_password])
		else
			user = User.find(params[:id])
		end

		if user && user.update(update_params)
			flash[:notice] = "You've successfully updated your user details."
			redirect_to dashboard_account_path
		else
			flash[:alert] = "Something went wrong!"
			redirect_to dashboard_account_path
		end
	end

	def destroy
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

  def user_params
    params.require(:user).permit(:email, :name, :phone_no, :password, :password_confirmation)
  end

  def not_authenticated
  	redirect_to login_path, alert: "Please login first."
  end

end
