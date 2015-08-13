class RemoveTransactionIdFromPaymentTransactions < ActiveRecord::Migration
  def change
    remove_column :payment_transactions, :transaction_id, :string
  end
end
