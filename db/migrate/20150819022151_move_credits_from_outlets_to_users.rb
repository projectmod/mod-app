class MoveCreditsFromOutletsToUsers < ActiveRecord::Migration
  def change
    remove_column :outlets, :credits, :integer
    add_column :users, :credits, :integer, default: 20
    rename_column :payment_transactions, :outlet_id, :user_id
  end
end
