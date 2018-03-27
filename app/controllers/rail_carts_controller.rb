class RailCartsController < ApplicationController
  def show
    @rail_cart = current_rail_cart
    @rail_items = current_rail_cart.rail_cart_items
  end
end