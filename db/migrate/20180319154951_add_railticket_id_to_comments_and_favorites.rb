class AddRailticketIdToCommentsAndFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :railticket_id, :integer
    add_column :favorites, :railticket_id, :integer
  end
end
