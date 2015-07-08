class RemoveAndAddTypeOfServiceInOutlets < ActiveRecord::Migration
  def change
    remove_column :outlets, :type_of_service
    add_column :outlets, :type_of_service, :string, default: [], array: true
  end
end
