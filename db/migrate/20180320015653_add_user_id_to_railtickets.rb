class AddUserIdToRailtickets < ActiveRecord::Migration[5.1]
  def change
     add_column :railtickets, :user_id, :integer
  end
end
