class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :outlet_id
      t.string :confirmation_code
      t.boolean :user_cancellation, default: false
      t.boolean :outlet_confirmed, default: false

      t.timestamps
    end
  end
end
