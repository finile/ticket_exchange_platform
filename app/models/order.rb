class Order < ApplicationRecord
  validates_presence_of :name, :address, :phone, :payment_status, :shipping_status

  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :coupons, through: :order_items
  has_many :payments

  def add_order_items(cart)
    cart.cart_items.each do |item|
      self.order_items.build(
        coupon_id: item.coupon.id,
        quantity: item.quantity,
        price: item.coupon.price
      )
    end
  end

  def subtotal
    order_items.map{ |x| x.item_total }.sum
  end

end
