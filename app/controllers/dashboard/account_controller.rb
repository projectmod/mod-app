class Dashboard::AccountController < ApplicationController

  def index
    @user = current_user
    @previous_bookings = BookingDecorator.wrap(@user.bookings.previously_booked)
    @current_booking = BookingDecorator.new(@user.bookings.just_booked)
  end
end
