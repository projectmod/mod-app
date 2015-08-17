class ChangePhoneNoToPhoneNumber < ActiveRecord::Migration
  def change
    rename_column :users, :phone_no, :phone_number
    rename_column :outlets, :phone_no, :phone_number
  end
end
