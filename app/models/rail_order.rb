class RailOrder < ApplicationRecord
  validates_presence_of :name, :address, :phone, :rail_payment_status, :rail_shipping_status

  belongs_to :user
  has_many :rail_order_items, dependent: :destroy
  has_many :railtickets, through: :rail_order_items
  has_many :payments

  PAYMENT_STATUS = [
    ["Not Paid", :not_paid],
    ["Paid", :paid]
  ]

  SHIPPING_STATUS = [
    ["Not Shipped", :not_shipped],
    ["Shipped",:shipped]
  ]

  def add_rail_order_items(rail_cart)
    rail_cart.rail_cart_items.each do |rail_item|
      self.rail_order_items.build(
        railticket_id: rail_item.railticket.id,
        quantity: rail_item.quantity,
        price: rail_item.railticket.price
      )
    end
  end

  def subtotal
    rail_order_items.map{ |x| x.rail_item_total }.sum
  end

end
