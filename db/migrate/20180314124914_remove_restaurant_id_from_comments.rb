class RemoveRestaurantIdFromComments < ActiveRecord::Migration[5.1]
  def change
   remove_column :comments, :restaurant_id
  end
end
