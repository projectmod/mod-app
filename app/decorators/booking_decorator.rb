class BookingDecorator < BaseDecorator

  def outlet_avatar
    outlet.avatar[0]
  end

  def outlet_name
    outlet.name.upcase
  end

  def outlet_area
    outlet.area.upcase
  end

  def outlet_address
    outlet.address.upcase
  end

  def outlet_phone_number
    "+60 " + outlet.phone_number
  end

  def outlet_image
    outlet.first_image
  end

  def confirmation_code
    model.confirmation_code.upcase
  end

  def arrival_time
    (model.created_at.time + 15.minutes).strftime("%I.%M%p")
  end

  def booked_on
    outlet.created_at.strftime("%d %B %Y").upcase
  end

  def outlet_working_hours
    outlet.working_hours.upcase
  end

  def customer_name
    model.user.name.upcase
  end

  def booking_time
    model.created_at.time.strftime("%I.%M%p")
  end

  private

  def outlet
    OutletDecorator.new(model.outlet)
  end
end
