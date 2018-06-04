class DropRailPayments < ActiveRecord::Migration[5.1]
  def change
    drop_table :rail_payments
  end
end
