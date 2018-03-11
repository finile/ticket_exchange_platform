class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :airline
      t.string :flight_no
      t.date :date_from
      t.date :date_to
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end


