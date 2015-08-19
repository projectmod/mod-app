class Dashboard::AccountController < ApplicationController
  before_action :require_login
  before_action :check_user_activated
  before_action :is_user?

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

  def is_user?
    unless current_user.user?
      flash[:notice] = "You're not authorized to access this page!"
      redirect_to root_path
    end
  end
end
