class Merchants::BookingsController < Merchants::BaseController
  before_action :set_booking

  def confirm
    if @booking.created_at > 3.minutes.ago
      @booking.update(outlet_confirmed: true)
      @booking.outlet.update(credits: @booking.outlet.credits - 2)

      message = "CONGRATS, merchant has confirmed with you, Here is your confirmation code: #{@booking.confirmation_code} Click on #{user_cancellation_confirmation_booking_url(@booking)} to cancel the booking"
      TwillioSMS.new(message, "+60" + @booking.user.phone_number).send
    end

    flash[:notice] = "You've successfully confirmed a booking made by #{@booking.user.name}"
    redirect_to merchants_dashboard_path
  end

  def success
  end

  def failure
  end

  private

  def set_booking
    booking = Booking.find(params[:id])
    @booking = BookingDecorator.new(booking)
  end
end
