class ChangeAvatarToArrayForOutlets < ActiveRecord::Migration
  def change
    remove_column :outlets, :avatar, :string
    add_column :outlets, :avatar, :string, default: [], array: true
  end
end
