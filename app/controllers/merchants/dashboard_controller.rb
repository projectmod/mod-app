class Merchants::DashboardController < Merchants::BaseController

  def index
    outlet = current_user.outlet
    @previous_bookings = BookingDecorator.wrap(outlet.bookings.previously_booked)
    @current_bookings = BookingDecorator.wrap(outlet.bookings.just_booked)
    @payment_transactions = PaymentTransactionsDecorator.wrap(current_user.payment_transactions)
  end
end
