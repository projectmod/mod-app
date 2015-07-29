class BookingDecorator < BaseDecorator

  def outlet_avatar
    model.outlet.avatar[0]
  end

  def outlet_name
    model.outlet.name.upcase
  end

  def outlet_area
    model.outlet.area.upcase
  end

  def outlet_address
    model.outlet.address.upcase
  end

  def outlet_phone_no
    "+60 " + model.outlet.phone_no
  end

  def confirmation_code
    model.confirmation_code.upcase
  end

  def arrival_time
    (model.created_at.time + 15.minutes).strftime("%I.%M%p")
  end

  def arrival_date
    model.outlet.created_at.strftime("%d %B %Y").upcase
  end

  def booked_on
    model.outlet.created_at.strftime("%d %B %Y").upcase
  end

  def outlet_working_hours
    model.outlet.working_hours.upcase
  end
end
