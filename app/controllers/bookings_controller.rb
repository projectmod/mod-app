class BookingsController < ActionController::Base
  before_action :require_login
  before_action :set_booking, only: [:pending, :update]

  def create
    binding.pry
    @booking = Booking.new(booking_params)

    to_phone = "+6"+params[:booking][:phone_no]
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: '+18885809742',
      to: to_phone,
      body: 'Twilio says hey there!' 
    )
    redirect_to pending_booking_path
  end

  def pending
    
  end

  def update

  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:phone_no, :user_id, :merchant_id, :confirmed, :outlet_attributes [:phone_no])
  end

end
