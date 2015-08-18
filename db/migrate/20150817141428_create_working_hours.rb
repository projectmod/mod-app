class CreateWorkingHours < ActiveRecord::Migration
  def change
    create_table :working_hours do |t|
      t.string :days
      t.string :time
      t.integer :outlet_id

      t.timestamps
    end
  end
end
