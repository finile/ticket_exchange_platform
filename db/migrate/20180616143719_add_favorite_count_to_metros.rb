class AddFavoriteCountToMetros < ActiveRecord::Migration[5.1]
  def change
    add_column :metros, :favorites_count, :integer, default: 0
  end
end
