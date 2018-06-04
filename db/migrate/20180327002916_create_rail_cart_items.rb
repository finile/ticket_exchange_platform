class CreateRailCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :rail_cart_items do |t|
      t.integer :rail_cart_id
      t.integer :railticket_id, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end
