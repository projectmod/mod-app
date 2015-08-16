class RemoveWorkingHoursFromOutlets < ActiveRecord::Migration
  def change
    remove_column :outlets, :working_hours, :string
  end
end
