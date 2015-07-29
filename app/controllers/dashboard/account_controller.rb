class Dashboard::AccountController < ApplicationController
  before_action :check_user_activated
  before_action :require_login

  def index
    @user = current_user
    @previous_bookings = BookingDecorator.wrap(@user.bookings.previously_booked)
    @current_booking = BookingDecorator.new(@user.bookings.just_booked.last)
  end

  private

  def check_user_activated
    if !current_user.activated?
      flash[:notice] = "Please verify your phone number to activate your account!"
      redirect_to edit_user_path(current_user)
    end
  end
end
