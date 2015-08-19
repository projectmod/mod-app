class AddCounterCacheToUser < ActiveRecord::Migration
  def change
    add_column :users, :payment_transactions_count, :integer
  end
end
