class Merchants::BookingsController < Base::MerchantsController
  
  def confirm
    if @booking.created_at < 1.minute
      @booking.update(outlet_confirmed: true)
      @booking.outlet.update(credits: @booking.outlet.credits - 2)

      # message = "CONGRATS, merchant has confirmed with you, Here is your confirmation code: #{@booking.confirmation_code} Click on #{user_cancellation_confirmation_booking_url(@booking)} to cancel the booking"
      # TwillioSMS.new(message, @booking.user_number)
    end
  end
end
