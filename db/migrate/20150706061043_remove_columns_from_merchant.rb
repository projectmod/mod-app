class RemoveColumnsFromMerchant < ActiveRecord::Migration
  def change
    remove_column :merchants, :latitute
    remove_column :merchants, :longitude
    remove_column :merchants, :price_range
    remove_column :merchants, :address
  end
end
