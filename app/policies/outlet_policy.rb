class OutletPolicy < ApplicationPolicy

  # Merchant Outlet Policies
  def show?
    record_exists?
    user.present? && user.merchant? && record.user == user
  end

  def edit?
    show?
  end

  def update?
    edit?
  end

  def customize?
    edit?
  end

  def photos?
    customize?
  end

  def refresh_availability?
    edit?
  end

  def toggle_availability?
    edit?
  end
end
