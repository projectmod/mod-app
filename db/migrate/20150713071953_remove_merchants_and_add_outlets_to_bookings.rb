class RemoveMerchantsAndAddOutletsToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :merchant_id
    remove_column :bookings, :merchants_number
    remove_column :bookings, :merchant_confirmed
    remove_column :bookings, :users_number

    add_column :bookings, :outlet_id, :integer
    add_column :bookings, :outlet_number, :integer
    add_column :bookings, :outlet_confirmed, :integer
    add_column :bookings, :user_number, :integer
  end
end
