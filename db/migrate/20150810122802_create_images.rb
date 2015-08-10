class CreateImages < ActiveRecord::Migration
  def change
    remove_column :outlets, :avatar, :string

    create_table :images do |t|
      t.integer :outlet_id
      t.string :content
      t.timestamps null: false
    end
  end
end
