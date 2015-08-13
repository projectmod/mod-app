class AddFeaturedToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :featured, :boolean, default: false
  end
end
