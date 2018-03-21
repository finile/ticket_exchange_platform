class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])   
    @posted_tickets = @user.tickets
    @posted_coupons = @user.coupons
    @posted_railtickets = @user.railtickets
  end

end
