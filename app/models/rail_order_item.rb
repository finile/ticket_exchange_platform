class RailOrderItem < ApplicationRecord
  belongs_to :railticket
  belongs_to :rail_order

  def rail_item_total
    self.quantity * self.railticket.price
  end

end