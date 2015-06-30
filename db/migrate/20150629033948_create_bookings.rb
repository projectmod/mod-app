class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :merchant_id
      t.boolean :confirmed, default: false

      t.timestamps null: false
    end
  end
end
