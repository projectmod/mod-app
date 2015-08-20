class Merchants::BookingsController < Merchants::BaseController
  before_action :set_booking

  def confirm
    if @booking.created_at > 3.minutes.ago
      @booking.update(outlet_confirmed: true)
      @booking.outlet.user.update(credits: @booking.outlet.user.credits - 2)

      message = "CONGRATS the merchant has confirmed with you. Here is your confirmation code: #{@booking.confirmation_code}. Click on #{user_cancellation_confirmation_booking_url(@booking)} to cancel the booking"
      TwilioSMS.new(message, "+60" + @booking.user.phone_number).send

      redirect_to success_merchants_booking_path(@booking)
    else
      redirect_to failure_merchants_booking_path(@booking)
    end
  end

  def success
  end

  def failure
  end

  private

  def set_booking
    booking = Booking.find(params[:id])
    authorize booking
    @booking = BookingDecorator.new(booking)
  end
end
