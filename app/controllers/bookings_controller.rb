class BookingsController < ActionController::Base
  def create
    to_phone = "+6"+params[:booking][:phone_no]
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: '+18885809742',
      to: to_phone,
      body: 'Hey there!'
    )
    redirect_to outlets_path
  end

  private

  def booking_params
    params.require(:booking).permit(:phone_no, :user_id, :merchant_id, :confirmed)
  end

end
