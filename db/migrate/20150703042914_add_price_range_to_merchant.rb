class AddPriceRangeToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :price_range, :string
  end
end
