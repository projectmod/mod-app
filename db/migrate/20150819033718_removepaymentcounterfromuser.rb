class Removepaymentcounterfromuser < ActiveRecord::Migration
  def change
    remove_column :users, :payment_transactions_count, :integer
  end
end
