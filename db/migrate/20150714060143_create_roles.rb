class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role
      t.integer :merchant_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
