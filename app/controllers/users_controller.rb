class UsersController < ApplicationController
	skip_before_action :require_login, except: [:update, :destroy]
	before_action :set_user, only: [:activate, :verify, :edit, :success]

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

	def success

	end

	def index
	end

	def edit
		# Step 3
		redirect_to verify_user_path(@user) unless @user.activated?
	end

	def create
		user = Users::Check.new(user_params[:phone_no]).exist

		if user && user.activated?
			redirect_to(new_user_session_path, notice: "This phone number is already tied to an account, please log in!")
		elsif user
			Users::VerificationCode.new(user).deliver
			auto_login(user, should_remember=false)
			redirect_to verify_user_path(user)
		else
			redirect_to root_path
		end
	end

	def update
		update_params = user_params.delete_if { |k,v| v.empty? }
		type = params[:user][:edit_type]

		if (update_params[:password] || update_params[:password_confirmation]) && type != "new_account"
			user = User.authenticate(update_params[:email], params[:user][:current_password])
		else
			user = User.find(params[:id])
		end

		if user && user.update(update_params)
			flash[:notice] = "You've successfully updated your user details."
			if session[:prebk_outlet]
				outlet = Outlet.find(session[:prebk_outlet])
				session[:prebk_outlet] = nil
				redirect_to outlet_path(outlet)
			else
				redirect_to dashboard_account_path
			end
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
