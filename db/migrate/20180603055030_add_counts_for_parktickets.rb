class AddCountsForParktickets < ActiveRecord::Migration[5.1]
  def change
    add_column :parktickets, :favorites_count, :integer, default: 0
    add_column :users, :parktickets_count, :integer, default: 0
  end
end
