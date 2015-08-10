class AddBusinessRegistrationToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :business_registration, :string
  end
end
