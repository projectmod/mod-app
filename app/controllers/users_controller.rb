class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :set_user, except: [:new, :create, :update]
	respond_to :js

	# Step 1
	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)

		if user.save
			auto_login(user, should_remember=false)

			flash[:notice] = "All registered! Now we'll need you to key in your phone number to verify your account."
			redirect_to edit_user_path(user)
		else
			compiled_message = ""
			user.errors.full_messages.each do |message|
				compiled_message = compiled_message + " " + message
			end

			flash[:error] = compiled_message
			redirect_to root_path
		end
	end

	# Step 2
	def edit
	end

	def update_phone_number
		# Remove if first number is 0
		number = params[:user][:phone_number]
		params[:user][:phone_number].slice!(0) if number.first == "0"

		if @user.update(user_params)
			Users::VerificationCode.new(@user).deliver
			redirect_to verify_user_path(@user)
		else
			flash[:error] = "Phone number is already in use. Please try again!"
			redirect_to :back
		end
	end

	def update
		update_params = user_params.delete_if { |k,v| v.empty? }

		if (update_params[:password] || update_params[:password_confirmation]) && type != "new_account"
			user = User.authenticate(update_params[:email], params[:user][:current_password])
		else
			user = current_user
		end

		authorize user

		if user && user.update(update_params)
			flash[:notice] = "You've successfully updated your user details."
		else
			compiled_message = ""
			user.errors.full_messages.each do |message|
				compiled_message = compiled_message + " " + message
			end

			flash[:error] = compiled_message
		end

		redirect_to dashboard_account_path
	end

	# Step 3
	def verify
	end

	def resend_code
		Users::VerificationCode.new(@user).deliver
		flash[:notice] = "We've sent you a new verification code. Please check your phone."
		respond_with(@user, location: verify_user_path(@user))
		flash.clear
	end

	def activate
		verification_code = params[:phone][:verification_code]
		outlet = Outlet.find_by(id: session[:prebk_outlet])
		session[:prebk_outlet] = nil

		activated = Users::Verify.new(verification_code, @user).check
		# code; compare it with db, if match activate user!
		if activated
			return redirect_to outlet_path(outlet) if outlet

			redirect_to success_user_path(@user)
		else
			redirect_to root_path
		end
	end

	# Step 4
	def success
	end

	private

	def set_user
		@user = User.find(params[:id])
		authorize @user
	end

  def user_params
    params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation)
  end

  def not_authenticated
  	redirect_to login_path, alert: "Please login first."
  end
end
