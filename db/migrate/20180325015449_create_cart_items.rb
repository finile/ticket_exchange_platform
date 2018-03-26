class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :coupon_id, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end
