class AddAreaToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :area, :string
  end
end
