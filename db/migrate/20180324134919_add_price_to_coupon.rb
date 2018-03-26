class AddPriceToCoupon < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :price, :integer
  end
end
