class RemoveUserConfirmedAndOutletConfirmedFromBookingsAndAddingThemBack < ActiveRecord::Migration
  def change
    remove_column :bookings, :outlet_confirmed
    remove_column :bookings, :user_confirmed

    add_column :bookings, :outlet_confirmed, :boolean, default: false
    add_column :bookings, :user_cancellation, :boolean, default: false
  end
end
