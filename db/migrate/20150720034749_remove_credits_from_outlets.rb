class RemoveCreditsFromOutlets < ActiveRecord::Migration
  def change
    remove_column :outlets, :credits
  end
end
