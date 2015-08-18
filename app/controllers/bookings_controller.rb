class BookingsController < ApplicationController
  before_action :require_login
  before_action :set_booking, except: :create

  def create
    @booking = Booking.new(booking_params)

    if @booking.outlet.availability == true && @booking.save

      message = "Someone wants to book with you, Click on #{confirm_merchants_booking_url(@booking)} to confirm, here is the confirmation code: #{@booking.confirmation_code}"
      binding.pry
      TwillioSMS.new(message, @booking.outlet.phone_number).send
      redirect_to pending_booking_path(@booking)
    else

      flash[:notice] = "Booking unsuccessful, merchant is not available"
      redirect_to :back
    end
  end

  def pending
  end

  def user_cancellation_confirmation
  end

  def user_cancellation
    @booking.update_attribute(:user_cancellation, true)
    total = @booking.outlet.credits + 2
    @booking.outlet.update_attribute(:credits, total)

    flash[:notice] = "You've successfully cancelled your booking!"
    redirect_to dashboard_account_path
  end

  def result
    @booking = BookingDecorator.new(@booking)
    @outlet = OutletDecorator.new(@booking.outlet)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_cancellation, :outlet_confirmed, :user_id, :outlet_id, :confirmation_code)
  end
end
