class AddUserRole < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
  end

  def self.down
    add_column :users, :role
  end
end
