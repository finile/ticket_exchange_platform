class AddUserIdToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :user_id, :integer
  end
end
