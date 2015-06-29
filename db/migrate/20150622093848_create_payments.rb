class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|

      t.timestamps null: false
      t.integer :credit
    end
  end
end
