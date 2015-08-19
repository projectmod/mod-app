class BookingPolicy < ApplicationPolicy

  # User Booking Policies
  def create?
    user.present? && user.user?
  end

  def pending?
    record_exists?
    create? && record.user == user
  end

  def result?
    pending?
  end

  def user_cancellation_confirmation?
    result?
  end

  def user_cancellation?
    user_cancellation_confirmation?
  end

  def check?
    pending?
  end

  # Merchant Booking Policies
  def confirm?
    user.present? && user.merchant? && record.outlet == user.outlet
  end

  def success?
    confirm?
  end

  def failure?
    success?
  end
end
