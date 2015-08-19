class PaymentTransactionPolicy < ApplicationPolicy

  def create?
    user.present && user.merchant? && record.outlet == user.outlet
  end

  def success?
    create?
  end

  def failure?
    success?
  end
end
