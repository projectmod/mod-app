class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.decimal :price
      t.string :description
      t.string :title
      t.integer :credits
      t.timestamps null: false
    end
  end
end
