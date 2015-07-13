class BookingsController < ActionController::Base
  before_action :require_login
  before_action :set_booking, only: [:pending, :update]

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      # @message = "Someone wants to book with you, Click on #{outlet_confirmed_booking_url(@booking)} to confirm"
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
  end

  def pending
  end

  def outlet_confirmed
    if @booking.created_at < 1.minute 
      @booking.update_attribute(:outlet_confirmed, true)
      # @message = "Merchant has gotten back to you, Click on #{user_confirmed_booking_url(@booking)} to confirm"
      # to_user_number = "+6"+ @booking.user_number
      # @client = Twilio::REST::Client.new
      # @client.messages.create(
      #   from: '+18885809742',
      #   to: to_user_number,
      #   body: @message.html_safe 
      # )
    end
  end

  def user_confirmed
    @booking.update_attribute(:user_confirmed, true)    
    total = @booking.outlet.credits - 1
    @booking.outlet.update_attribute(:credits, total)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:oulet_number, :user_number, :user_confirmed, :outlet_confirmed, :user_id, :outlet_id)
  end

end
