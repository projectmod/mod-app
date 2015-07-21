class RemoveMerchantIdFromOutlet < ActiveRecord::Migration
  def change
    remove_column :outlets, :merchant_id
  end
end
