class AddCompletedBooleanToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :completed_registration, :boolean, default: false
  end
end
