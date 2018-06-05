class CreateParktickets < ActiveRecord::Migration[5.1]
  def change
    create_table :parktickets do |t|
      t.string :park_name
      t.datetime :park_expiry_date
      t.integer :price
      t.integer :quantity
      t.string :image
      t.text :others
      
      t.timestamps
    end
  end
end
