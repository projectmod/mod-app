class ChangeDataTypeOfPhoneToString < ActiveRecord::Migration
  def change
    change_column :users, :phone_number, :string

    change_column :bookings, :outlet_number, :string
    change_column :bookings, :user_number, :string
  end
end
