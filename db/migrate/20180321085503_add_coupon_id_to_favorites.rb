class AddCouponIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :coupon_id, :integer
  end
end
