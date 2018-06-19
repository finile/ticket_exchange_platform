class AddParkNameToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :park_name, :string
  end
end

