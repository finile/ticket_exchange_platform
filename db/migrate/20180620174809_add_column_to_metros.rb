class AddColumnToMetros < ActiveRecord::Migration[5.1]
  def change
    add_column :metros, :user_id, :integer
    add_column :metros, :quantity, :integer
    add_column :users, :metros_count, :integer, default: 0
    change_column :metros, :days, :integer
  end
end
