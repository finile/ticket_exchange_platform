class AddQuantityToCouponRailticket < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :quantity, :integer
    add_column :railtickets, :quantity, :integer
  end
end
