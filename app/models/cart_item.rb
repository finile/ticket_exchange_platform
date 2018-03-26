class CartItem < ApplicationRecord
  belongs_to :cart 
  belongs_to :coupon

  def item_total
    self.quantity * self.coupon.price 
  end

end
