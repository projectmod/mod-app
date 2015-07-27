class BookingsController < ApplicationController
  before_action :require_login
  before_action :set_booking, only: [:pending, :outlet_confirmed, :user_cancellation, :result]

  def create
    @booking = Booking.new(booking_params)
    if @booking.outlet.availability == true
      if @booking.save
        # @message = "Someone wants to book with you, Click on #{outlet_confirmed_booking_url(@booking)} to confirm, here is the confirmation code: #{@booking.confirmation_code}"
        # to_outlet_number = "+6"+params[:booking][:outlet_number]
        # @client = Twilio::REST::Client.new
        # @client.messages.create(
        #   from: '+18885809742',
        #   to: to_outlet_number,
        #   body: @message.html_safe
        # )
        redirect_to pending_booking_path(@booking)
      else
        redirect_to :back, notice: "Booking unsuccessful, please try again"
      end
    else
      redirect_to :back, notice: "Booking unsuccessful, merchant is not available"
    end
  end

  def pending
  end

  def outlet_confirmed
    if @booking.created_at < 1.minute
      @booking.update_attribute(:outlet_confirmed, true)
      total = @booking.outlet.credits - 1
      @booking.outlet.update_attribute(:credits, total)
      # @message = "CONGRATS, merchant has confirmed with you, Here is your confirmation code: #{@booking.confirmation_code} Click on #{user_cancellation_booking_url(@booking)} to cancel the booking"
      # to_user_number = "+6"+ @booking.user_number
      # @client = Twilio::REST::Client.new
      # @client.messages.create(
      #   from: '+18885809742',
      #   to: to_user_number,
      #   body: @message.html_safe
      # )
    end
  end

  def user_cancellation
    @booking.update_attribute(:user_cancellation, true)
    total = @booking.outlet.credits + 1
    @booking.outlet.update_attribute(:credits, total)
  end

  def result
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:outlet_number, :user_number, :user_cancellation, :outlet_confirmed, :user_id, :outlet_id, :confirmation_code)
  end

end
