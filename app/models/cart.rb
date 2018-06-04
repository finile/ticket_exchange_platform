class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :coupons, through: :cart_items


  def add_cart_item(coupon)
    cart_item = cart_items.build( coupon_id: coupon.id, quantity: coupon.quantity)
    cart_item.save!
    self.cart_items
  end


  def subtotal
    cart_items.map{|x| x.item_total }.sum
  end

  def find_item_by(coupon)
    self.cart_items.where(coupon_id: coupon).first
  end

end
