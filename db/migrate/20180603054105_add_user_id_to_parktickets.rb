class AddUserIdToParktickets < ActiveRecord::Migration[5.1]
  def change
    add_column :parktickets, :user_id, :integer
  end
end
