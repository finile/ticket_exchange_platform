class RailCart < ApplicationRecord
  # has_many :rail_cart_items, dependent: :destroy
  # has_many :railtickets, through: :rail_cart_items


  # def add_rail_cart_item(railticket)
  #   rail_cart_item = rail_cart_items.build( railticket_id: railticket.id, quantity: railticket.quantity)
  #   rail_cart_item.save! 
  #   self.rail_cart_items
  # end


  # def subtotal
  #   rail_cart_items.map{|x| x.rail_item_total }.sum
  # end

  # def find_item_by(railticket)
  #   self.rail_cart_items.where(railticket_id: railticket).first
  # end

end
