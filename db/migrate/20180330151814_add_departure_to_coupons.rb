class AddDepartureToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :departure, :string
  end
end
