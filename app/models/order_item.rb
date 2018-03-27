class OrderItem < ApplicationRecord
  belongs_to :coupon
  belongs_to :order

  def item_total
    self.quantity * self.coupon.price
  end

end
