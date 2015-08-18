class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :outlet_id
      t.string :content

      t.timestamps
    end
  end
end
