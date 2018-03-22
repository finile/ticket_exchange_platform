class AddDepartureToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :departure, :string
  end
end
