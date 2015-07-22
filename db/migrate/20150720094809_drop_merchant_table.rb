class DropMerchantTable < ActiveRecord::Migration
  def change
    if table_exists?("merchants")
      drop_table :merchants
    end
  end
end
