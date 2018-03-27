class CreateRailCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :rail_carts do |t|

      t.timestamps
    end
  end
end
