class AddFavoriteCountToUserTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favorites_count, :integer, default: 0
    add_column :tickets, :favorites_count, :integer, default: 0
    add_column :coupons, :favorites_count, :integer, default: 0
    add_column :railtickets, :favorites_count, :integer, default: 0
  end
end

