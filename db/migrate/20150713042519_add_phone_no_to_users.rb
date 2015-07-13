class AddPhoneNoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_no, :integer
  end
end
