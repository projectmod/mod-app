class AddCounterCacheToOutlets < ActiveRecord::Migration
  def change
    add_column :outlets, :bookings_count, :integer
  end
end
