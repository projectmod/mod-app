class AddDefaultValueForMerchantConfirmedAndUserConfirmed < ActiveRecord::Migration
  def change
    change_column :bookings, :merchant_confirmed, :boolean, :default => false
    change_column :bookings, :user_confirmed, :boolean, :default => false
  end
end
