class RemoveColumnAirline < ActiveRecord::Migration[5.1]
  def change
    remove_column :railtickets, :airline
  end
end
