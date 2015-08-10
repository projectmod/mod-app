class Merchants::DashboardController < Merchants::BaseController

  def index
    @user = current_user
    @previous_bookings = BookingDecorator.wrap(@user.bookings.previously_booked)
    @current_booking = BookingDecorator.new(@user.bookings.just_booked.last)
  end
end
