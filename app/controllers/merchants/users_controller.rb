class Merchants::UsersController < Merchants::BaseController
  before_action :set_user, only: [:edit, :show, :update]
  # skip_before_action :is_merchant?, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge({role: "merchant"}))

    if @user.save
      @outlet = Outlet.create
      @user.outlet = @outlet
      redirect_to merchants_outlet_step_path(@outlet, "salon_info")
    else
      redirect_to new_merchants_users_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :phone_no, :password, :password_confirmation)
  end
end
