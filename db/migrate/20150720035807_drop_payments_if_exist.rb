class DropPaymentsIfExist < ActiveRecord::Migration
  def change
    if table_exists?("payments")
      drop_table :payments
    end
  end
end
