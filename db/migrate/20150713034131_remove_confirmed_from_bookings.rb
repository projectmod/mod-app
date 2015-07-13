class RemoveConfirmedFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :confirmed
    add_column :bookings, :user_confirmed, :boolean
    add_column :bookings, :merchant_confirmed, :boolean
  end
end
