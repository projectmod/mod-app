class AddUserIdToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :user_id, :integer
  end
end
