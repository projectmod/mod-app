class Merchants::BookingsController < Merchants::BaseController
  before_action :set_booking, except: :confirm

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking

    if @booking.created_at > 3.minutes.ago
      @booking.update(outlet_confirmed: true)
      @booking.outlet.user.update(credits: @booking.outlet.user.credits - 2)
      arrival_time = (@booking.created_at.time + 15.minutes).strftime("%I.%M%p")

      message = "RM0.00: mod.com.my • Congratulations! The salon has confirmed your booking. Please be there by #{arrival_time}. Here is your confirmation code: #{@booking.confirmation_code}.
                To cancel the booking, please click on this link: #{user_cancellation_confirmation_booking_url(@booking)}"
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
