class AddOtherTicketCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :coupons_count, :integer, default: 0
    add_column :users, :railtickets_count, :integer, default: 0
  end
end
