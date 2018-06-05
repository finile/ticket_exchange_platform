class AddParkticketIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :parkticket_id, :integer
  end
end
