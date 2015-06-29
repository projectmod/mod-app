class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :payment_transactions do |t|

      t.timestamps null: false
      t.decimal :price
      t.string :receipt_code
    end
  end
end
