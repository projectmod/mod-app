class AddColumnsToPaymentTransactions < ActiveRecord::Migration
  def change
    add_column :payment_transactions, :bank_ref_no, :string
    remove_column :payment_transactions, :receipt_code, :string
    add_column :payment_transactions, :payment_id, :string
  end
end
