class RailCartItem < ApplicationRecord
  belongs_to :rail_cart
  belongs_to :railticket

  def item_total
    self.quantity * self.railticket.price 
  end

end
