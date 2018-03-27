class RenamePaymentStatusShippingStatusInRailOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :rail_orders, :payment_status, :rail_payment_status
    rename_column :rail_orders, :shipping_status, :rail_shipping_status

  end
end
