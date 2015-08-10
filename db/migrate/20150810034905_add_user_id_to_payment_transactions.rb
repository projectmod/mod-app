class AddUserIdToPaymentTransactions < ActiveRecord::Migration
  def change
    add_column :payment_transactions, :user_id, :integer
  end
end
