class CreateOutlets < ActiveRecord::Migration
  def change
    create_table :outlets do |t|
      t.string :name
      t.string :area
      t.string :address
      t.string :state
      t.float :latitude
      t.float :longitude
      t.string :price_range
      t.string :type_of_service, default: [], array: true
      t.string :phone_number
      t.boolean :availability, default: false
      t.integer :credits, default: 20
      t.integer :user_id
      t.string :business_registration, null: false
      t.boolean :completed_registration, default: false
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
