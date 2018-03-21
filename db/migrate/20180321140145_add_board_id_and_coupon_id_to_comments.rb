class AddBoardIdAndCouponIdToComments < ActiveRecord::Migration[5.1]
  def change
   add_column :comments, :coupon_id, :integer
   add_column :comments, :board_id, :integer
  end
end
