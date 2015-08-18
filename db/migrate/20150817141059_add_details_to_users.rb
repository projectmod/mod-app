class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :verification_code, :string
    add_column :users, :activated, :boolean, default: false
    add_column :users, :role, :integer, default: 0 
  end
end
