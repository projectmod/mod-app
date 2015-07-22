class RemoveMerchantIdFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :merchant_id, :integer
  end
end
