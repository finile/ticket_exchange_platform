class AddCartableToCartitem < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :cartable_id, :integer
    add_column :cart_items, :cartable_type, :string
  end
end
