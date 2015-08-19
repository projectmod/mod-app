class RemoveArrayFromTypeOfServiceFromOutlets < ActiveRecord::Migration
  def change
    change_column :outlets, :type_of_service, :string, default: ""
  end
end
