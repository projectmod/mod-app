class RemoveUserIdFromMerchants < ActiveRecord::Migration
  def change
    remove_column :merchants, :user_id
  end
end
