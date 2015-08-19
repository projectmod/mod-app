class PaymentTransactionPolicy < ApplicationPolicy

  def create?
    user.present? && user.merchant? && record.user == user
  end

  def success?
    create?
  end

  def failure?
    success?
  end
end
