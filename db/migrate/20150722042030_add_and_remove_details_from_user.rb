class AddAndRemoveDetailsFromUser < ActiveRecord::Migration
  def change
    add_column :users, :activated, :boolean, default: false
    remove_column :users, :activation_state, :string
    remove_column :users, :activation_token, :string
    remove_column :users, :activation_token_expires_at, :datetime
  end
end
