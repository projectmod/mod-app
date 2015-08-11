class AddTransactionIdToPaymentTransactions < ActiveRecord::Migration
  def change
    add_column :payment_transactions, :transaction_id, :string
  end
end
