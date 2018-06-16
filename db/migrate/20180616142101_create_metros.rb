class CreateMetros < ActiveRecord::Migration[5.1]
  def change
    create_table :metros do |t|
      t.string :ticket_type
      t.string :days
      t.date :expire_date
      t.string :area
      t.integer :price
      t.string :image
      t.text :others
      t.integer :favorites_count, default: 0
      t.timestamps
    end
  end
end
