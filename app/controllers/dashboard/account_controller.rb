class Dashboard::AccountController < ApplicationController

  def index
    @user = current_user
    @previous_bookings = @user.bookings.where("created_at < ?", 15.minutes.ago)
    @current_booking = @user.bookings.where("created_at > ?", 15.minutes.ago).last
  end
end
