class RemovePhoneNoFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :phone_no, :string
    add_column :bookings, :users_number, :string
    add_column :bookings, :merchants_number, :string
  end
end
