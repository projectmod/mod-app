class RemoveFieldsFromMerchants < ActiveRecord::Migration
  def change
    remove_column :merchants, :type_of_service
    remove_column :merchants, :avatar
  end
end
