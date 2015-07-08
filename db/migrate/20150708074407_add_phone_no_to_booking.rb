class AddPhoneNoToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :phone_no, :string
  end
end
