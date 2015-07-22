class AddDetailsToPaymentTransactions < ActiveRecord::Migration
  def change
    add_column :payment_transactions, :payment_method, :string
    add_column :payment_transactions, :package_id, :integer
  end
end
