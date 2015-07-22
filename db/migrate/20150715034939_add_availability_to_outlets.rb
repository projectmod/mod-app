class AddAvailabilityToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :availability, :boolean, default: false
  end
end
