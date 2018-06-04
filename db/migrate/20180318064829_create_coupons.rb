class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :airline
      t.string :destination
      t.date :coupon_expiry_date
      t.date :flight_date_from
      t.date :flight_date_to
      t.string :tax
      t.string :image
      t.text :others
      
      t.timestamps
    end
  end
end
