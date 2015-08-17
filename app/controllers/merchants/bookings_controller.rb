class Merchants::BookingsController < Merchants::BaseController
  before_action :set_booking

  def confirm
    if @booking.created_at < 3.minutes
      @booking.update(outlet_confirmed: true)
      @booking.outlet.update(credits: @booking.outlet.credits - 2)

      message = "CONGRATS, merchant has confirmed with you, Here is your confirmation code: #{@booking.confirmation_code} Click on #{user_cancellation_confirmation_booking_url(@booking)} to cancel the booking"
      TwillioSMS.new(message, @booking.user.phone_number)
    end
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
