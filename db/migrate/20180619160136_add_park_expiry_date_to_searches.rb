class AddParkExpiryDateToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :park_expiry_date, :datetime
  end
end

