class CreateRailPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :rail_payments do |t|
      t.integer :rail_order_id, index: true
      t.string :payment_method
      t.integer :amount
      t.datetime :paid_at
      t.text :params

      t.timestamps
    end
  end
end
