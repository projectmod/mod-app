class CreatePaymentTransactions < ActiveRecord::Migration
  def change
    create_table :payment_transactions do |t|
      t.decimal :price
      t.string :payment_method
      t.integer :package_id
      t.integer :outlet_id
      t.string :bank_ref_no
      t.string :payment_id

      t.timestamps
    end
  end
end
