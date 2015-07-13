class BookingsController < ActionController::Base
  before_action :require_login
  before_action :set_booking, only: [:pending, :update]

  def create
    binding.pry
    @booking = Booking.new(booking_params)

    @message = "Someone wants to book with you, Click on #{confirm_booking_url(@booking)} to confirm"
    # to_phone = "+6"+params[:booking][:merchants_numbers]
    # @client = Twilio::REST::Client.new
    # @client.messages.create(
    #   from: '+18885809742',
    #   to: to_phone,
    #   body: @message.html_safe 
    # )
    if @booking.save
      redirect_to pending_booking_path(@booking)
    else 
      redirect_to :back, notice: "Booking unsuccessful, please try again"
    end
  end

  def update
  end

  def pending
  end

  def confirm
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:phone_no, :user_id, :merchant_id, :confirmed)
  end

end
