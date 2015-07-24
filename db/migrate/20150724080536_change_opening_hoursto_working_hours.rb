class ChangeOpeningHourstoWorkingHours < ActiveRecord::Migration
  def change
    remove_column :outlets, :opening_days, :string
    remove_column :outlets, :opening_hours, :string
    add_column :outlets, :working_hours, :string
  end
end
