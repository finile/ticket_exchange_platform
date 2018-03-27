class AddRailOrderIdToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :rail_order_id, :integer
  end
end
