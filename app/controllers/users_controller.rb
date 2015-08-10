class UsersController < ApplicationController
	skip_before_action :require_login, except: [:update, :destroy]
	before_action :set_user, only: [:activate, :verify, :edit, :success, :update_phone_no]

	def new
		# Step 1
		@user = User.new
	end

	def verify
		# Step 3
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

	def success
	end

	def index
	end

	def edit
		# Step 2
	end

	def create
		user = User.new(user_params)

		if user.save
			auto_login(user, should_remember=false)
			redirect_to edit_user_path(user)
		else
			redirect_to root_path
		end
	end

	def update_phone_no
		if @user.update(user_params)
			Users::VerificationCode.new(@user).deliver
			redirect_to verify_user_path(@user)
		else
			redirect_to root_path
		end
	end

	def update
		update_params = user_params.delete_if { |k,v| v.empty? }

		if (update_params[:password] || update_params[:password_confirmation]) && type != "new_account"
			user = User.authenticate(update_params[:email], params[:user][:current_password])
		else
			user = current_user
		end

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
