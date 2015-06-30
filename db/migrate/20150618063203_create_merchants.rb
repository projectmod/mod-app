class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :address
      t.string :type_of_service
      t.float :latitute
      t.float :longitude

      t.timestamps null: false
    end
  end
end
