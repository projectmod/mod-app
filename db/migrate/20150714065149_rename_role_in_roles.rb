class RenameRoleInRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :role

    add_column :roles, :name, :string
  end
end
