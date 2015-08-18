class Merchants::UsersController < Merchants::BaseController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :is_merchant?, only: [:new, :create]

  def new
  end

  def create
    business_registration = user_params[:business_registration]
    params[:user].delete(:business_registration)

    @user = User.new(user_params.merge({role: "merchant"}))

    if @user.save
      @outlet = @user.create_outlet(business_registration: business_registration)
      redirect_to merchants_outlet_step_path(@outlet, "outlet_info")
    else
      @user.errors.full_messages.each do |message|
        flash[:alert] = message
      end
      redirect_to new_merchants_user_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation, :business_registration)
  end
end
