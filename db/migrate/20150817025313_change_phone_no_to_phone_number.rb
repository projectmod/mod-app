class ChangePhoneNoToPhoneNumber < ActiveRecord::Migration
  def change
    rename_column :users, :phone_number, :phone_number
    rename_column :outlets, :phone_number, :phone_number
  end
end
