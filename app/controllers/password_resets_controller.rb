class PasswordResetsController < ApplicationController
  before_action :set_token_and_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by_email(params[:password_resets][:email])
    @user.deliver_reset_password_instructions! if @user

    flash[:notice] = "We've send you the instructions on how to reset your password to your email!"
    redirect_to password_resets_path
  end

  def edit
  end

  def update
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.change_password!(params[:user][:password])

      flash[:notice] = "You've successfully updated your password, please log in!"
      redirect_to root_path
    else

      flash[:notice] = "We ran into some issues updating your password, please try again!"
      render action: 'edit'
    end
  end

  private

  def set_token_and_user
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end
end
