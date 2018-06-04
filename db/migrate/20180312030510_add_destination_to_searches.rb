class AddDestinationToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :destination, :string
  end
end



