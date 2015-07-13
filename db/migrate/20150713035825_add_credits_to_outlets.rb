class AddCreditsToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :credits, :integer
  end
end
