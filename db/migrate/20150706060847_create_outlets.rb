class CreateOutlets < ActiveRecord::Migration
  def change
    create_table :outlets do |t|
      t.integer :merchant_id
      t.string :name
      t.string :address
      t.string :state
      t.float :latitude
      t.float :longitude
      t.string :price_range
      t.string :avatar
      t.string :type_of_service

      t.timestamps null: false
    end
  end
end
