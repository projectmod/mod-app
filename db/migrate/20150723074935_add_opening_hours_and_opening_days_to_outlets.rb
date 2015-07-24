class AddOpeningHoursAndOpeningDaysToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :opening_hours, :string
    add_column :outlets, :opening_days, :string
  end
end
