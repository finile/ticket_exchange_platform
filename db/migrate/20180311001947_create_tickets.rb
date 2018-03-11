class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :airline
      t.string :flight_no
      t.date :flight_date
      t.time :flight_time
      t.string :departure
      t.string :destination
      t.string :name
      t.integer :price
      t.string :image
      t.text :others

      t.timestamps
    end
  end
end
