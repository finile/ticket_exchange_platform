class CreateComboards < ActiveRecord::Migration[5.1]
  def change
    create_table :comboards do |t|
      t.date :flight_date_from
      t.date :flight_date_to
      t.string :departure
      t.string :destination
      t.string :name
      t.integer :price
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
