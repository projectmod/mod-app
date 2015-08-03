class Merchants::UsersController < Merchants::BaseController
  before_action :set_user, only: [:edit, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge({ role: "merchant"}))

    if @user.save
      redirect_to edit_merchants_users_path
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
