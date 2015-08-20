class AddPaymentTransactionsCounterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :payment_transactions_count, :integer, default: 0
    change_column :outlets, :bookings_count, :integer, default: 0
  end
end
