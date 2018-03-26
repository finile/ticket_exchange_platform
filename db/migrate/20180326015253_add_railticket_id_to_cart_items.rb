class AddRailticketIdToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :railticket_id, :integer
  end
end
