class CreateRailtickets < ActiveRecord::Migration[5.1]
  def change
    create_table :railtickets do |t|
      t.string :airline
      t.string :train_no
      t.date :train_date
      t.time :departure_time
      t.time :arrive_time
      t.string :departure
      t.string :destination
      t.string :name
      t.integer :price
      t.integer :discount
      t.string :image
      t.text :others
      t.timestamps
    end
  end
end
