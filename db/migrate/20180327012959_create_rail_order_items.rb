class CreateRailOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :rail_order_items do |t|
      t.integer :rail_order_id
      t.integer :railticket_id
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
