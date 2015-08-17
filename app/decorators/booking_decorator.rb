class BookingDecorator < BaseDecorator

  def confirmation_code
    model.confirmation_code.upcase
  end

  def arrival_time
    (model.created_at.time + 15.minutes).strftime("%I.%M%p")
  end

  def booked_on
    model.created_at.strftime("%d %B %Y").upcase
  end

  def customer_name
    model.user.name.upcase
  end

  def booking_time
    model.created_at.time.strftime("%I.%M%p")
  end

  def outlet
    OutletDecorator.new(model.outlet)
  end
end
