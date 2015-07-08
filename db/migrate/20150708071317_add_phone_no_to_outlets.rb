class AddPhoneNoToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :phone_no, :string
  end
end
