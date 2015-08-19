class UserPolicy < ApplicationPolicy

  def edit?
    user.present? && record == user
  end

  def update_phone_number?
    edit?
  end

  def update?
    edit?
  end

  def verify?
    edit?
  end

  def resend_code?
    edit?
  end

  def activate?
    edit?
  end

  def success?
    edit?
  end
end
