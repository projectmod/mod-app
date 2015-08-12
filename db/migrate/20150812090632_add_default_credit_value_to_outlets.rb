class AddDefaultCreditValueToOutlets < ActiveRecord::Migration
  def change
    change_column :outlets, :credits, :integer, default: 20
  end
end
