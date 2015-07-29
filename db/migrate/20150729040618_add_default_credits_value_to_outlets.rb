class AddDefaultCreditsValueToOutlets < ActiveRecord::Migration
  def change
    change_column :outlets, :credits, :integer, default: 0
  end
end
